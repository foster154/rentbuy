class Guest < ActiveRecord::Base
	has_many :queries
	has_one :prequal
	accepts_nested_attributes_for :queries
	accepts_nested_attributes_for :prequal

	after_save :deliver_request_info_to_agent, if: :email

	# validates_presence_of :email, on: :update

	self.per_page = 20

	private

	# === EMAILS === #
	def deliver_request_info_to_agent
	    GuestMailer.request_form_submission(self).deliver
	end
end
