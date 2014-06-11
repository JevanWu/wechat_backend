class AutoRepliesController < ApplicationController

  def subscribe_reply
    @text_message = TextMessage.where(label: "subscribe").first || TextMessage.create(content: "Type your message here", label: "subscribe")
  end

  def update_subscribe_reply
    @text_message = TextMessage.find(params[:id])
    @text_message.update(permitted_params)
    redirect_to subscribe_reply_path
  end

  def default_reply
    @text_message = TextMessage.where(label: "default").first || TextMessage.create(content: "Type your message here", label: "default")
  end

  def update_default_reply
    @text_message = TextMessage.find(params[:id])
    @text_message.update(permitted_params)
    redirect_to default_reply_path
  end

  private

  def permitted_params
    params.require(:text_message).permit(:content)
  end
end
