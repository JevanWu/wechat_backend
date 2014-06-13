class SubscribeRepliesController < ApplicationController

  def index
    @subscribe_reply = SubscribeReply.first || SubscribeReply.create(content: "Type your message here")
  end

  def update
    @subscribe_reply = SubscribeReply.find(params[:id])
    @subscribe_reply.update(permitted_params)
    redirect_to subscribe_replies_path
  end

  private

  def permitted_params
    params.require(:subscribe_reply).permit(:content)
  end
end
