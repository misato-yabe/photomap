class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :photos, dependent: :destroy
  has_one_attached :image
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワーの取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  has_many :sns_credentials, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

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

  # ーー↓フォロー機能の実装ーー

    # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  # ーー↑フォロー機能の実装ーー

  # ーー↓SNS認証機能の実装ーー

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  # ーー↑SNS認証機能の実装ーー
end
