class Query < ActiveRecord::Base
	belongs_to :guest
	belongs_to :area
end
