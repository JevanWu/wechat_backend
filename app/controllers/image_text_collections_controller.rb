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
    3.times { @image_text = @image_text_collection.image_texts.build }
    # end
  end

  def edit
    @image_text_collection = ImageTextCollection.find(params[:id])
  end

  def update
    @image_text_collection = ImageTextCollection.find(params[:id])
    if @image_text_collection.update(collection_params)
      redirect_to image_text_collection_path(@image_text_collection)
    else
      render 'edit'
    end
  end

  def create
    
    @image_text_collection = ImageTextCollection.create(collection_params)

    redirect_to image_text_collection_path(@image_text_collection)
  end

  def show
    @image_text_collection = ImageTextCollection.find(params[:id])
  end

  def destroy
    @image_text_collection = ImageTextCollection.find(params[:id])
    @image_text_collection.destroy
    redirect_to image_texts_path
  end

  private

  def collection_params
    params.require(:image_text_collection).permit(image_texts_attributes: [:id, :title, :author, :cover, :body, :_destroy])
  end
end
