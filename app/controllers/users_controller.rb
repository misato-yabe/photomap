class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @photos = user.photos.order("created_at DESC")
  end

  def edit
    
  end
end
