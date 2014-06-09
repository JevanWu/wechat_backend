require 'digest/sha1'
class WechatController < ApplicationController
  respond_to :json
  
  def receiver
    signature = params[:signature]
    timestamp = params[:timestamp]
    nonce = params[:nonce]
    token = "hualirocks2014"

    if check_signature(signature, timestamp, nonce, token)
      render text: nonce
    end
  end

  private

  def check_signature(signature, timestamp, nonce, token)
    decrypted_token = decrypt(signature, timestamp, nonce)

    if decrypted_token == token
      return true
    else
      return false
    end
  end

  def decrypt(signature, timestamp, nonce)
    signature_array = [signature, timestamp, nonce]
    signature_array.sort
    signature_string = signature_array.join("")
    Digest::SHA1.hexdigest signature_string
  end
end
