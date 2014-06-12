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

  #key words replies
  Message.all_except_event_messages.each do |message|
    on :text, with: message.keyword do |request|
      request.reply.text message.content unless message.nil?
    end
  end
end
