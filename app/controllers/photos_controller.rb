class PhotosController < ApplicationController
  before_action :authenticate_user!,only:[:new]
  before_action :search_photo, only: [:index, :search,:search_map]

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
    @results = @p.result.includes(params[:prefecture_id],params[:situation_id],params[:weather_id],params[:month_id],params[:camera_id],params[:lens_id])
    if params[:sort] == 'tohoku'
      @event = Photo.where(prefecture_id:8)
      @events = @event.includes(params[:prefecture_id],params[:situation_id],params[:weather_id],params[:month_id],params[:camera_id],params[:lens_id]).order("created_at DESC")
    end
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