class PhotosController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :move_to_index,only:[:new,:edit]
  before_action :photo_set,only:[:edit,:show,:update,:destroy]
  before_action :contributor_confirmation, only: [:edit,:update,:destroy]

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
    @p = Photo.ransack(params[:q])
    # @photos = Photo.all
    @photos = @p.result.includes(params[:prefecture_id],params[:situation_id],params[:weather_id],params[:month_id],params[:camera_id],params[:lenz_id])
    # if params[:sort] == 'hokkaido'
    #   @results = Photo.where(prefecture_id: 2 ).order("id DESC")
    # else
    # @p = Photo.ransack(params[:q])
    # @photos = Photo.all
    # @results = @p.result.includes(params[:prefecture_id],params[:situation_id],params[:weather_id],params[:month_id],params[:camera_id],params[:lenz_id])
    # end

  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @photo.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to photo_path(@photo)
    end
  end



  private

  def photo_params
    params.require(:photo)
    .permit(:title,:comment,:prefecture_id,:situation_id,:weather_id,:month_id,:camera_id,:lenz_id, images: [])
    .merge(user_id: current_user.id)
  end

  def photo_set
    @photo = Photo.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @photo.user
  end
end