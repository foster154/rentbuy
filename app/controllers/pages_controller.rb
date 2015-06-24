class PagesController < ApplicationController

	before_action :set_loan_vars, only: [:calculator]

	def home
		render layout: 'application-front'
	end

	def privacy_policy
		render layout: 'application-front'
	end

	def fair_housing
		render layout: 'application-front'
	end

	def thank_you
		render layout: 'application-front'
	end

	def calculator
	end

	private

  def set_loan_vars
    @apr = current_account.apr.to_f
    @ti = current_account.ti.to_f
  end

end
