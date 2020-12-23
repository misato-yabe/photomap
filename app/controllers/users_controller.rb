class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order("created_at DESC")

  end

  def edit
    
  end
end
