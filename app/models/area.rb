class Area < ActiveRecord::Base
	has_many :properties

	validates :name, presence: true
	validates :city, presence: true
	validates :state, presence: true
end
