class Guest < ActiveRecord::Base
	has_many :queries
	accepts_nested_attributes_for :queries

	self.per_page = 20
end
