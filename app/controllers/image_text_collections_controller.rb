require 'pry'
class ImageTextCollectionsController < ApplicationController
  
  def index 
    @image_text_collections = ImageTextCollection.all
  end

  def new
    # if params[:collection]
    #   @image_text_collection = ImageTextCollection.find(params[:collection])
    #   @image_texts = @image_text_collection.image_texts
    #   @image_text = @image_text_collection.image_texts.build
    # else
    @image_text_collection = ImageTextCollection.new
    @image_text = @image_text_collection.image_texts.build
    # end
  end

  def edit
    @image_text_collection = ImageTextCollection.find(params[:id])
  end

  def update
    @image_text_collection = ImageTextCollection.find(params[:id])
    # if @collection.update(image_text_params)
    #   redirect_to image_text_path(@image_text)
    # else
    #   render 'edit'
    # end
  end

  def create
    # if params[:image_text_collection]
    
    binding.pry
    @image_text_collection = ImageTextCollection.create(collection_params)
    # else
    #   @image_text = ImageText.create(image_text_params)
    #   @image_text_collection = ImageTextCollection.find(params[:image_text][:image_text_collection_id])
    # end

    redirect_to image_text_collection_path(@image_text_collection)
  end

  def show
    @image_text_collection = ImageTextCollection.find(params[:id])
  end

  private

  def collection_params
    params.require(:image_text_collection).permit(image_texts_attributes: [:title, :author, :cover, :body])
  end

  def image_text_params
    params.require(:image_text).permit(:title, :author, :cover, :body, :image_text_collection_id)
  end
end
