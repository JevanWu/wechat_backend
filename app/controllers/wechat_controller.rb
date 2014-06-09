require 'digest/sha1'
require 'rexml/xpath'
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
    token = "hualirocks2014"

    if check_signature(signature, timestamp, nonce, token)
      render text: echostr
    else
      flash[:error] = "URL verification failed"
      redirect_to root_path
    end
  end

  def process_post_request
    msg_type = REXML::XPath.first(request, "MsgType").value
    puts msg_type
    render xml: {ToUserName: "wechat", FromUserName: "JevanWu", CreateTime: "123456", MsgType: "text", Content: "It's a test"}
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
