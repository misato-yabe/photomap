class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    # @photos = user.photo
  end
end
