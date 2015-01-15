class Gallery < ActiveRecord::Base
	belongs_to :supply
	belongs_to :photo
end
