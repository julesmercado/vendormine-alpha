class Supply < ActiveRecord::Base
	belongs_to :supplier
	has_many :bundle_supplies
	has_many :bundles, through: :bundle_supplies
end
