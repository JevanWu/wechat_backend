class DefaultRepliesController < ApplicationController

  def index
    @default_reply = DefaultReply.first || DefaultReply.create(content: "Type your message here")
  end

  def update
    @default_reply = DefaultReply.find(params[:id])
    @default_reply.update(permitted_params)
    redirect_to default_replies_path
  end

  private

  def permitted_params
    params.require(:default_reply).permit(:keyword, :content)
  end
end
