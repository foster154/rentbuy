class PagesController < ApplicationController
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

end
