module PrequalsHelper

	def preapproved(income, debt, down_payment)
		income = income.to_i
		debt = debt.to_i
		down_payment = down_payment.to_i

		$max_monthly_payment = ((income / 12) - debt) * 0.4

		m = $max_monthly_payment
		r = 0.06
		n = 360

		$max_principle = (m * ((1 + r/12)**n - 1)) / ((r/12) * (1 + r/12)**n)

		$check_down_payment = (down_payment - $max_principle / 0.965 * 0.035)

		$can_afford_income = $max_principle / 0.965 + (down_payment - $max_principle / 0.965 * 0.035)
		$can_afford_down = down_payment / 0.035

		if (income.to_i / 12) - debt <= 0
			$your_number = down_payment
		elsif $check_down_payment >= 0
			$your_number = $can_afford_income
		else
			$your_number = $can_afford_down
		end
	end
end

# module PrequalsHelper

# 	def preapproved(income, debt, down_payment)
# 		$max_monthly_payment = ((income / 12) - debt) * 0.4

# 		m = $max_monthly_payment
# 		r = 0.06
# 		n = 360

# 		$can_afford_income = (m * ((1 + r/12)**n - 1)) / ((r/12) * (1 + r/12)**n)
		
# 		$can_afford_down = down_payment * 20

# 	end

# end
