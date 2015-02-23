class Prequal < ActiveRecord::Base
	include ActiveModel::Dirty

	after_save :deliver_guest_prequal_email, if: :military_changed?
	after_save :deliver_prequal_info_to_agent_lender, if: ( :yes_call_changed? || :yes_email_changed? )

	belongs_to :guest

	private

	# === EMAILS === #
	def deliver_guest_prequal_email
      PrequalMailer.prequal_submission_to_guest(self).deliver
    end

    def deliver_prequal_info_to_agent_lender
      PrequalMailer.prequal_submission_to_agent_lender(self).deliver
    end
end
