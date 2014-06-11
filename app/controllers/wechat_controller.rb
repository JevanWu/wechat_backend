require 'digest/sha1'

class WechatController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:receiver]

  def receiver
    if request.request_method == "POST"
      process_post_request
    else
      process_get_request
    end
  end

  private

  def process_get_request
    signature = params[:signature]
    timestamp = params[:timestamp]
    nonce = params[:nonce]
    echostr = params[:echostr]
    token = ENV["WECHAT_TOKEN"]

    if check_signature(signature, timestamp, nonce, token)
      render text: echostr
    else
      flash[:error] = "URL verification failed"
      redirect_to root_path
    end
  end

  def process_post_request
    msg_type = params[:xml][:MsgType]
    if msg_type == "event"
      process_event_msg
    elsif msg_type == "text"
      process_normal_msg
    end
  end

  def process_normal_msg
    to_user_name = params[:xml][:ToUserName]
    from_user_name = params[:xml][:FromUserName]
    create_time = params[:xml][:CreateTime]
    content = params[:xml][:Content]
    message = TextMessage.where(label: "default").first
    render xml: {ToUserName: from_user_name, FromUserName: to_user_name, CreateTime: generate_create_time, MsgType: "text", Content: message.content }
  end

  def process_event_msg
    event = params[:xml][:Event]
    to_user_name = params[:xml][:ToUserName]
    from_user_name = params[:xml][:FromUserName]
    create_time = params[:xml][:CreateTime]
    message = TextMessage.where(label: event.downcase).first
    render xml: {ToUserName: from_user_name, FromUserName: to_user_name, CreateTime: generate_create_time, MsgType: "text", Content: message.content }
  end

  def generate_create_time(time=Time.now)
    create_time = (time - Time.new(1970)) * 1000
    return create_time.to_i
  end

  def check_signature(signature, timestamp, nonce, token)
    encrypted_token = encrypt(token, timestamp, nonce)

    if encrypted_token == signature
      return true
    else
      return false
    end
  end

  def encrypt(token, timestamp, nonce)
    signature_array = [token, timestamp, nonce]
    signature_array.sort!
    signature_string = signature_array.join("")
    Digest::SHA1.hexdigest signature_string
  end
end
