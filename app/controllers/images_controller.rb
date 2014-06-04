class ImagesController < ApplicationController

  def index 
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    redirect_to image_path(@image)
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to image_path(@image)
    else
      render 'edit'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
