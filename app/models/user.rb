class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :photos
  has_one_attached :image

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
      validates :name
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: 'Full-width katakana characters' } do
      validates :name_kana
    end

    with_options uniqueness: true do
      validates :nickname
      validates :email
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true, on: :create, format: { with: PASSWORD_REGEX, message: 'Include both letters and numbers' }

end
