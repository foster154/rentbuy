module PrequalsHelper

	def preapproved(income, debt, down_payment)
		$max_monthly_payment = ((income / 12) - debt) * 0.4

		m = $max_monthly_payment
		r = 0.06
		n = 360

		$can_afford_income = (m * ((1 + r/12)**n - 1)) / ((r/12) * (1 + r/12)**n)
		
		$can_afford_down = down_payment * 20

	end

end
