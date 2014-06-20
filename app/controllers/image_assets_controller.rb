class ImageAssetsController < ApplicationController

  def index 
    @image_assets = ImageAsset.all
  end

  def new
    @image_asset = ImageAsset.new
  end

  def create
    if @image_asset = ImageAsset.create(image_asset_params)
      WechatUploader.upload_image(@image_asset)
      redirect_to image_asset_path(@image_asset)
    else
      render 'new'
    end
  end

  def edit
    @image_asset = ImageAsset.find(params[:id])
  end

  def update
    @image_asset = ImageAsset.find(params[:id])
    if @image_asset.update(image_asset_params)
      redirect_to image_asset_path(@image_asset)
    else
      render 'edit'
    end
  end

  def show
    @image_asset = ImageAsset.find(params[:id])
  end

  def destroy
    @image_asset = ImageAsset.find(params[:id])
    @image_asset.destroy
    redirect_to image_assets_path
  end

  private

  def image_asset_params
    params.require(:image_asset).permit(:image)
  end
end
