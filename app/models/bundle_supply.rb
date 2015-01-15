class BundleSupply < ActiveRecord::Base
	belongs_to :bundle
	belongs_to :supply
end
