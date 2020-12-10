class PhotosController < ApplicationController
  def index
    @photos = Photo.includes(:user).order("created_at DESC")
  end
end
