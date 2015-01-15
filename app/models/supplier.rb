class Supplier < ActiveRecord::Base
	has_secure_password
	attr_accessor :login_email, :login_password
	has_many :supplies
	has_many :photos, through: :galleries
	has_many :galleries
	mount_uploader :avatar, AvatarUploader


	validates :supplier_name, presence: true
	validates :supplier_address, presence: true
	validates :supplier_contact_no, presence: true
	validates :supplier_email, presence: true
	validates :supplier_desc, presence: true
	validates :password, presence: true
end
