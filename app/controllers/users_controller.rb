class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @photos = Photo.includes(:user).order("created_at DESC")
  end
end
