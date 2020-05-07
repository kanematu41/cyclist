class Post < ApplicationRecord
	mount_uploaders :image, ImageUploader #carrierwave関連
	serialize :image

	belongs_to :user

end
