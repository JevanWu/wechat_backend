class NewsAssetCollectionsController < ApplicationController
  
  def index 
    @news_asset_collections = NewsAssetCollection.all
  end

  def new
    @news_asset_collection = NewsAssetCollection.new
    @news_asset = @news_asset_collection.news_assets.build 
    # end
  end

  def edit
    @news_asset_collection = NewsAssetCollection.find(params[:id])
  end

  def update
    @news_asset_collection = NewsAssetCollection.find(params[:id])
    if @news_asset_collection.update(collection_params)
      redirect_to news_asset_collection_path(@news_asset_collection)
    else
      render 'edit'
    end
  end

  def create
    @news_asset_collection = NewsAssetCollection.create(collection_params)

    redirect_to news_asset_collection_path(@news_asset_collection)
  end

  def show
    @news_asset_collection = NewsAssetCollection.find(params[:id])
  end

  def destroy
    @news_asset_collection = NewsAssetCollection.find(params[:id])
    @news_asset_collection.destroy
    redirect_to news_assets_path
  end

  private

  def collection_params
    params.require(:news_asset_collection).permit(news_assets_attributes: [:id, :title, :author, :cover, :description, :url, :_destroy])
  end
end
