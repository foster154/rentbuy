class Guest < ActiveRecord::Base
	has_many :queries
	has_one :prequal
	accepts_nested_attributes_for :queries
	accepts_nested_attributes_for :prequal

	# validates_presence_of :email, on: :update

	self.per_page = 20
end
