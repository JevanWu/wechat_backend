class OrdinaryRepliesController < ApplicationController
  
  def index 
    @ordinary_replies = OrdinaryReply.all
  end

  def new
    @ordinary_reply = OrdinaryReply.new
  end

  def edit
    @ordinary_reply = OrdinaryReply.find(params[:id])
  end

  def update
    @ordinary_reply = OrdinaryReply.find(params[:id])
    if @ordinary_reply.update(permitted_params)
      redirect_to ordinary_reply_path(@ordinary_reply)
    else
      render 'edit'
    end
  end

  def create
    @ordinary_reply = OrdinaryReply.create(permitted_params)
    redirect_to ordinary_reply_path(@ordinary_reply)
  end

  def show
    @ordinary_reply = OrdinaryReply.find(params[:id])
  end

  def destroy
    @ordinary_reply = OrdinaryReply.find(params[:id])
    @ordinary_reply.destroy
    redirect_to ordinary_replys_path
  end

  private

  def permitted_params
    params.require(:ordinary_reply).permit(:type, :keyword, :content)
  end
end
