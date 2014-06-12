class WechatsController < ApplicationController
  wechat_responder

  on :event, with: "subscribe" do |request|
    message = TextMessage.where(label: "subscribe").first
    request.reply.text "#{message.content}" unless message.nil?
  end

  on :event, with: "unsubscribe" do |request|
    message = TextMessage.where(label: "unsubscribe").first
    request.reply.text "#{message.content}" unless message.nil?
  end

  on :text do |request, content|
    message = TextMessage.where(label: "default").first
    request.reply.text message.content unless message.nil?
  end

  on :text, with: "help" do |request, help|
    request.reply.text "This is help content"
  end
end
