class WechatsController < ApplicationController
  wechat_responder

  # on :event, with "subscribe" do |request|
  #   message = TextMessage.where(label: "subscribe").first
  #   request.reply.text "#{message.content}"
  # end

  on :text do |request, content|
    message = TextMessage.where(label: "default").first
    request.reply.text message.content unless message.nil?
  end
end
