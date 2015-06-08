class Guest < ActiveRecord::Base

	include ActiveModel::Dirty

	belongs_to :account

	has_many :queries
	accepts_nested_attributes_for :queries

	validates_presence_of :income, :debt, :down_payment
	validates :email, presence: true, if: "email_page?"
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, if: "email_page?"

	self.per_page = 20

	before_create :strip_formatting_from_numbers

	# Send emails
	after_save :deliver_email_to_guest, if: :email_changed? # could potentially send email twice, if they input on guest#step4 and then update it on guest#results
	after_save :deliver_email_to_agent, if: :email_changed?
	after_save :deliver_email_to_lender, if: :email_changed?
	after_save :deliver_update_email_to_lender, if: ( :yes_call_changed? || :yes_email_changed? )
	after_save :deliver_update_email_to_agent, if: ( :yes_call_changed? || :yes_email_changed? )

	private	

	# === Emails === #

	def deliver_email_to_guest
  	GuestMailer.to_guest(self).deliver
  end

	def deliver_email_to_agent
	    GuestMailer.to_agent(self).deliver
	end

	def deliver_email_to_lender
  	GuestMailer.to_lender(self).deliver
  end

  def deliver_update_email_to_agent
  	GuestMailer.to_agent_update(self).deliver
  end

  def deliver_update_email_to_lender
  	GuestMailer.to_lender_update(self).deliver
  end

    # === Number Formatting === #

	def strip_formatting_from_numbers 	# to remove commas added to web form for readability
		if self.income.include? ","
			self.income = self.income.to_s.gsub!(/\D+/, '').to_i
		end
		if self.debt.include? ","
			self.debt = self.debt.to_s.gsub!(/\D+/, '').to_i
		end
		if self.down_payment.include? ","
			self.down_payment = self.down_payment.to_s.gsub!(/\D+/, '').to_i
		end
	end

	def raw_income	# not sure what this is for. Can remove?
	  self.income
	end
	def raw_income=(s)	# not sure what this is for. Can remove?
	  self.income = s.gsub(/\D/, '')
	end

end
