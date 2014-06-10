class NewsAssetsController < ApplicationController
  
  def index 
    @news_assets = NewsAsset.all
    @news_asset_collections = NewsAssetCollection.all
  end

  def new
    @news_asset = NewsAsset.new
    # @partial = params[:partial]
    # respond_to do |format|
    #   format.js { render "update.js" }
    # end
  end

  def edit
    @news_asset = NewsAsset.find(params[:id])
  end

  def update
    @news_asset = NewsAsset.find(params[:id])
    if @news_asset.update(news_asset_params)
      redirect_to news_asset_path(@news_asset)
    else
      render 'edit'
    end
  end

  def create
    @news_asset = NewsAsset.create(news_asset_params)
    redirect_to news_asset_path(@news_asset)
  end

  def show
    @news_asset = NewsAsset.find(params[:id])
  end

  def destroy
    @news_asset = NewsAsset.find(params[:id])
    @news_asset.destroy
    redirect_to news_assets_path
  end

  private

  def news_asset_params
    params.require(:news_asset).permit(:title, :author, :cover, :body)
  end
end
