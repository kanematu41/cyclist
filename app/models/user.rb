class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image #refileでの画像アップ用

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー取得
  has_many :following_user, through: :follower, source: :followed #自分がフォローしている
  has_many :follower_user, through: :followed, source: :follower #自分をフォローしている

  validates :name, presence: true

  # ユーザーをフォロー
  def follow(user_id)
  	follower.create(followed_id: user_id)
  end

  # ユーザーのフォロー外す
  def unfollow(user_id)
  	follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
  	following_user.include?(user)
  end
end
