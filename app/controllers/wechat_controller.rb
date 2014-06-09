require 'digest/sha1'
class WechatController < ApplicationController
  respond_to :json
  
  def receiver
    signature = params[:signature]
    timestamp = params[:timestamp]
    nonce = params[:nonce]
    token = "EuK8378d11ckeRXam86T5Pt37z6W1F8b"

    if check_signature(signature, timestamp, nonce)
      render text: nonce
    end
  end

  private

  def check_signature(signature, timestamp, nonce)
    decrypted_token = decrypt(signature, timestamp, nonce)

    if decrypted_token == token
      return true
    else
      return false
    end
  end

  def decrypt(signature, timestamp, nonce)
    credential = [signature, timestamp, nonce]
    credential.sort
    credential.join("")
    Digest::SHA1.hexdigest credential
  end
end
