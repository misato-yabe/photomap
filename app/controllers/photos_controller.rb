class PhotosController < ApplicationController
  def index
    @photos = Photo.order("created_at DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to user_path(current_user.id)
    else
      @photos = @photo.user_id
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo)
    .permit(:image,:title,:comment,:prefecture_id,:situation_id,:weather_id,:month_id,:camera_id,:lens_id)
    .merge(user_id: current_user.id)
  end
end