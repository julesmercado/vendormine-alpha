class Bundle < ActiveRecord::Base
	has_many :bundles_supplies
	has_many :supplies, through: :bundles_supplies
end
