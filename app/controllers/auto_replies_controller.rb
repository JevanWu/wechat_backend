class AutoRepliesController < ApplicationController

  def subscribe_reply
    @text_message = TextMessage.where(keyword: "subscribe").first || TextMessage.create(content: "Type your message here", keyword: "subscribe")
  end

  def update_subscribe_reply
    @text_message = TextMessage.find(params[:id])
    @text_message.update(permitted_params)
    redirect_to subscribe_reply_path
  end

  def default_reply
    @text_message = TextMessage.where(keyword: "default").first || TextMessage.create(content: "Type your message here", keyword: "default")
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
