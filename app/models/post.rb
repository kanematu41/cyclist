class Post < ApplicationRecord
	mount_uploaders :image, ImageUploader #carrierwave関連
	serialize :image

	belongs_to :user
	has_many 	 :comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence:true

end
