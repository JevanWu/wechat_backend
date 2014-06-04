class ImageTextsController < ApplicationController
  
  def index 
    @image_texts = ImageText.all
    @image_text_collections = ImageTextCollection.all
  end

  def new
    @image_text = ImageText.new
    # @partial = params[:partial]
    # respond_to do |format|
    #   format.js { render "update.js" }
    # end
  end

  def edit
    @image_text = ImageText.find(params[:id])
  end

  def update
    @image_text = ImageText.find(params[:id])
    if @image_text.update(image_text_params)
      redirect_to image_text_path(@image_text)
    else
      render 'edit'
    end
  end

  def create
    @image_text = ImageText.create(image_text_params)
    redirect_to image_text_path(@image_text)
  end

  def show
    @image_text = ImageText.find(params[:id])
  end

  def destroy
    @image_text = ImageText.find(params[:id])
    @image_text.destroy
    redirect_to image_texts_path
  end

  private

  def image_text_params
    params.require(:image_text).permit(:title, :author, :cover, :body)
  end
end
