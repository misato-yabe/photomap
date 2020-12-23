class UsersController < ApplicationController
  before_action :authenticate_user!,only:[:edit,:new]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
    unless user_signed_in? && current_user.id == @user.user_id
      redirect_to action: :index
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :consept])
  end
end
