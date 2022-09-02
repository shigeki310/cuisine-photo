class PhotosController < ApplicationController
  before_action :set_photo, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    # @photo = Photo.all.order(created_at: :desc)
    @q = Photo.all.ransack(params[:q])
    # ページネーションをつけたいデータに.page(params[:page])を追加
    @photos = @q.result(distinct: true).page(params[:page]).per(6)
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

  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
      redirect_to root_path
  end





  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image).merge(user_id: current_user.id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user == @photo.user
  end

  
end