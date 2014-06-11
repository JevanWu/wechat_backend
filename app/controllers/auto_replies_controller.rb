class AutoRepliesController < ApplicationController

  def subscribed_reply
    @text_message = TextMessage.where(label: "subscribed").first || TextMessage.create(content: "Type your message here", label: "subscribed")
  end

  def update_subscribed_reply
    
  end
end
