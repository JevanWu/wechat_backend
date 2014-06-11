class WechatsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:receiver]
  wechat_responder

  on :event, with "subscribe" do |request|
    message = TextMessage.where(label: "subscribe").first
    request.reply.text "#{message.content}"
  end
end
