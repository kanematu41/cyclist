class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image # refile画像
  acts_as_paranoid # 論理削除

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy # 自分からの通知
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy # 相手からの通知
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms

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

  # フォロー通知
  def create_notification_follow!(current_user)
    # フォローされているか検索
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ?", current_user.id, id, "follow"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: "follow"
      )
    end
    notification.save if notification.valid? # 空でなければ
  end

  # 検索
  def self.search(search, _user_or_post)
    if search
      User.where(["name LIKE ?", "%#{search}%"])
    else
      User.all
    end
  end
end
