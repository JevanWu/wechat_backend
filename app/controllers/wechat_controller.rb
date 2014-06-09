require 'digest/sha1'
class WechatController < ApplicationController
  respond_to :json
  
  def receiver
    signature = params[:signature]
    timestamp = params[:timestamp]
    nonce = params[:nonce]
    echostr = params[:echostr]
    token = "EuK8378d11ckeRXam86T5Pt37z6W1F8b"

    if check_signature(signature, timestamp, nonce, token)
      render text: echostr
    else
      flash[:error] = "URL verification failed"
      redirect_to root_path
    end
  end

  private

  def check_signature(signature, timestamp, nonce, token)
    decrypted_token = decrypt(token, timestamp, nonce)

    if decrypted_token == signature
      return true
    else
      return false
    end
  end

  def decrypt(token, timestamp, nonce)
    signature_array = [token, timestamp, nonce]
    signature_array.sort
    signature_string = signature_array.join("")
    Digest::SHA1.hexdigest signature_string
  end
end
