class MenuRepliesController < ApplicationController
  
  def index 
    @menu_replies = MenuReply.all
  end

  def new
    @menu_reply = MenuReply.new
  end

  def edit
    @menu_reply = MenuReply.find(params[:id])
    keywords = @menu_reply.keywords.map(&:keyword)
    @menu_reply.keyword = keywords.join(", ")
  end

  def update
    @menu_reply = MenuReply.find(params[:id])
    if @menu_reply.update(permitted_params) && update_keywords
      redirect_to menu_reply_path(@menu_reply)
    else
      redirect_to edit_menu_reply_path(@menu_reply)
    end
  end

  def create
    @menu_reply = MenuReply.create(permitted_params)
    keywords = params[:menu_reply][:keyword].split(", ")
    keywords.each do |keyword|
      @menu_reply.keywords.create(keyword: keyword)
    end
    redirect_to menu_reply_path(@menu_reply)
  end

  def show
    @menu_reply = MenuReply.find(params[:id])
  end

  def destroy
    @menu_reply = MenuReply.find(params[:id])
    @menu_reply.destroy
    redirect_to menu_replies_path
  end

  private

  def permitted_params
    params.require(:menu_reply).permit(:content, :asset_id)
  end

  def update_keywords
    keywords = params[:menu_reply][:keyword].split(", ")
    if @menu_reply.keywords.map(&:keyword) != keywords
      @menu_reply.keywords.destroy_all
      keywords.each do |keyword|
        @menu_reply.keywords.create(keyword: keyword)
      end
    end
    return true
  end

end
