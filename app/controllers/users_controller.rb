class UsersController < ApplicationController
  before_action :authenticate_user!,only:[:edit,:update]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_params,only:[:edit,:update]
  before_action :user_set,only:[:show,:edit,:update]

  def show
    @photos = @user.photos.order("created_at DESC")
    @user = User.find(params[:id])
  end

  def edit
    unless user_signed_in? && current_user.id == @user.user_id
      redirect_to action: :index
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(@user)
    else
      render template: "devise/registrations/edit"
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :image, :concept])
  end

  def user_params
    params.require(:user).permit(:nickname, :concept, :image)
  end

  def user_set
    @user = User.find(params[:id])
  end
end
