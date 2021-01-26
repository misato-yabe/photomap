class LikesController < ApplicationController
  before_action :photo_set,only:[:create,:destroy]

  def create
    @like = current_user.likes.create(photo_id: params[:photo_id])
    redirect_to photo_path(@photo)
  end

  def destroy
    @like = Like.find_by(photo_id: params[:photo_id], user_id: current_user.id)
    @like.destroy
    redirect_to photo_path(@photo)
  end
end

private

def photo_set
  @photo = Photo.find(params[:id])
end