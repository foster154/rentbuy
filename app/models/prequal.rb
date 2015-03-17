class Prequal < ActiveRecord::Base
	include ActiveModel::Dirty

	before_create :strip_formatting_from_numbers

	after_save :deliver_guest_prequal_email, if: :military_changed?
	after_save :deliver_prequal_info_to_agent, if: ( :yes_call_changed? || :yes_email_changed? )
	after_save :deliver_prequal_info_to_lender, if: ( :yes_call_changed? || :yes_email_changed? )

	belongs_to :guest

	validates_presence_of :income, :debt, :down_payment


	private

	def strip_formatting_from_numbers
		self.income = self.income.to_s.gsub!(/\D+/, '').to_i
		self.debt = self.debt.to_s.gsub!(/\D+/, '').to_i
		self.down_payment = self.down_payment.to_s.gsub!(/\D+/, '').to_i
	end

	def raw_income
	  self.income
	end
	def raw_income=(s)
	  self.income = s.gsub(/\D/, '')
	end

	# === EMAILS === #
	def deliver_guest_prequal_email
      PrequalMailer.prequal_submission_to_guest(self).deliver
    end

    def deliver_prequal_info_to_agent
      PrequalMailer.prequal_submission_to_agent(self).deliver
    end

    def deliver_prequal_info_to_lender
      PrequalMailer.prequal_submission_to_lender(self).deliver
    end
end
