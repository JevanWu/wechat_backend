class OrdinaryRepliesController < ApplicationController
  
  def index 
    @ordinary_replies = OrdinaryReply.all
  end

  def new
    @ordinary_reply = OrdinaryReply.new
  end

  def edit
    @ordinary_reply = OrdinaryReply.find(params[:id])
    keywords = @ordinary_reply.keywords.map(&:keyword)
    @ordinary_reply.keyword = keywords.join(", ")
  end

  def update
    @ordinary_reply = OrdinaryReply.find(params[:id])
    if @ordinary_reply.update(permitted_params) && update_keywords
      redirect_to ordinary_reply_path(@ordinary_reply)
    else
      redirect_to edit_ordinary_reply_path(@ordinary_reply)
    end
  end

  def create
    @ordinary_reply = OrdinaryReply.create(permitted_params)
    keywords = params[:ordinary_reply][:keyword].split(", ")
    keywords.each do |keyword|
      @ordinary_reply.keywords.create(keyword: keyword)
    end
    redirect_to ordinary_reply_path(@ordinary_reply)
  end

  def show
    @ordinary_reply = OrdinaryReply.find(params[:id])
  end

  def destroy
    @ordinary_reply = OrdinaryReply.find(params[:id])
    @ordinary_reply.destroy
    redirect_to ordinary_replies_path
  end

  private

  def permitted_params
    params.require(:ordinary_reply).permit(:content, :asset_id)
  end

  def update_keywords
    keywords = params[:ordinary_reply][:keyword].split(", ")
    if @ordinary_reply.keywords.map(&:keyword) != keywords
      @ordinary_reply.keywords.destroy_all
      keywords.each do |keyword|
        @ordinary_reply.keywords.create(keyword: keyword)
      end
    end
    return true
  end

end
