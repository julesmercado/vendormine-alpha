class Photo < ActiveRecord::Base
	has_many :supplies, through: :galleries
	has_many :galleries
	mount_uploader :avatar, AvatarUploader
end
