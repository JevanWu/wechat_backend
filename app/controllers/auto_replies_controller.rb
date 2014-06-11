class AutoRepliesController < ApplicationController

  def subscribed_reply
    @text_message = TextMessage.where(label: "subscribe").first || TextMessage.create(content: "Type your message here", label: "subscribe")
  end

  def update_subscribed_reply
    @text_message = TextMessage.find(params[:id])
    @text_message.update(permitted_params)
    redirect_to subscribed_reply_path
  end

  private

  def permitted_params
    params.require(:text_message).permit(:content)
  end
end
