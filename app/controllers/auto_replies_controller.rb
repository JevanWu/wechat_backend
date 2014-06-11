class AutoRepliesController < ApplicationController

  def subscribed_reply
    @text_message = TextMessage.where(label: "subscribed").first || TextMessage.create(content: "Type your message here", label: "subscribed")
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
