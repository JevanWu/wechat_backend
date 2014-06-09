require 'digest/sha1'
class WechatController < ApplicationController
  
  def receiver
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

  private

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
