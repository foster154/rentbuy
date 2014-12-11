class Area < ActiveRecord::Base
	has_many :properties
	has_many :queries

	validates :name, presence: true
	validates :city, presence: true
	validates :state, presence: true
end
