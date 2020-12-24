class PhotosController < ApplicationController
  before_action :authenticate_user!,only:[:new]
  before_action :search_photo, only: [:index, :search]

  def index
    @photos = Photo.all.order("created_at DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def search
    @situations = Situation.all
    @results = @p.result.includes(params[:situation_id])
  end

  private

  def photo_params
    params.require(:photo)
    .permit(:title,:comment,:prefecture_id,:situation_id,:weather_id,:month_id,:camera_id,:lens_id, images: [])
    .merge(user_id: current_user.id)
  end

  def search_photo
    @p = Photo.ransack(params[:q])
  end

end