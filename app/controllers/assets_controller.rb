class AssetsController < ApplicationController

  def index 
    @image_texts = ImageText.all
  end

  def new
    @image_text = ImageText.new
    # @partial = params[:partial]
    # respond_to do |format|
    #   format.js { render "update.js" }
    # end
  end

  def create
    @image_text = ImageText.create(image_text_params)
    redirect_to asset_path(@image_text)
  end

  def show
    @image_text = ImageText.find(params[:id])
  end

  private

  def image_text_params
    params.require(:image_text).permit(:title, :author, :cover, :body)
  end
end
