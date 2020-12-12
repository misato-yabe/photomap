class Photo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :situation
  belongs_to_active_hash :weather
  belongs_to_active_hash :month
  belongs_to_active_hash :camera
  belongs_to_active_hash :len
  belongs_to :user
  # belongs_to :area
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
    validates :situation_id,numericality: { other_than: (1,2,10,15), message: 'Select' }

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :prefecture_id
      validates :weather_id
      validates :month_id
      validates :camera_id
      validates :lens_id
    end
  end
end
