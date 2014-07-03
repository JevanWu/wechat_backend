class KeywordRepliesController < ApplicationController
  
  def index 
    @keyword_replies = KeywordReply.all
  end

  def new
    @keyword_reply = KeywordReply.new
  end

  def edit
    @keyword_reply = KeywordReply.find(params[:id])
    keywords = @keyword_reply.keywords.map(&:keyword)
    @keyword_reply.keyword = keywords.join(", ")
  end

  def update
    @keyword_reply = KeywordReply.find(params[:id])
    if @keyword_reply.update(permitted_params) && update_keywords
      redirect_to keyword_reply_path(@keyword_reply)
    else
      redirect_to edit_keyword_reply_path(@keyword_reply)
    end
  end

  def create
    @keyword_reply = KeywordReply.create(permitted_params)
    keywords = params[:keyword_reply][:keyword].split(", ")
    keywords.each do |keyword|
      @keyword_reply.keywords.create(keyword: keyword)
    end
    redirect_to keyword_reply_path(@keyword_reply)
  end

  def show
    @keyword_reply = KeywordReply.find(params[:id])
  end

  def destroy
    @keyword_reply = KeywordReply.find(params[:id])
    @keyword_reply.destroy
    redirect_to keyword_replies_path
  end

  private

  def permitted_params
    params.require(:keyword_reply).permit(:content, :asset_id)
  end

  def update_keywords
    keywords = params[:keyword_reply][:keyword].split(", ")
    if @keyword_reply.keywords.map(&:keyword) != keywords
      @keyword_reply.keywords.destroy_all
      keywords.each do |keyword|
        @keyword_reply.keywords.create(keyword: keyword)
      end
    end
    return true
  end

end
