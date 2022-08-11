class PhotosController < ApplicationController

  def index
    @photo = Photo.all.order(created_at: :desc)
  end

  def new 
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image).merge(user_id: current_user.id)
  end
  
end