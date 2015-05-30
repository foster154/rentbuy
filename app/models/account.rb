class Account < ActiveRecord::Base
	has_many :guests
	has_many :users
end
