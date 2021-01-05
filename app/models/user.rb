class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :photos
  has_one_attached :image

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' } do
      validates :name
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/, message: 'は全角カタカナで入力してください' } do
      validates :name_kana
    end

    with_options uniqueness: true do
      validates :nickname
      validates :email
    end
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true, on: :create, format: { with: PASSWORD_REGEX, message: 'は6文字以上の半角英数字で入力してください' }

end
