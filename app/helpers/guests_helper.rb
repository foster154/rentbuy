module GuestsHelper

	# def rb_calculator(income, debt, down_payment)
	# 	income = income.to_i
	# 	debt = debt.to_i
	# 	down_payment = down_payment.to_i

	# 	max_monthly_payment = ((income / 12) - debt) * 0.45
	# 	fha_r = @apr + @ti + 0.0085
	# 	conv_r = @apr + @ti + 0.0059
	# 	term = 360

	# 	@max_fha_principle = (max_monthly_payment * ((1 + fha_r/12)**term - 1)) / ((fha_r/12) * (1 + fha_r/12)**term)

	# 	@max_conv_principle = (max_monthly_payment * ((1 + conv_r/12)**term - 1)) / ((conv_r/12) * (1 + conv_r/12)**term)

	# end

	def rb_calculator_old(income, debt, down_payment)
		income = income.to_i
		debt = debt.to_i
		down_payment = down_payment.to_i

		$max_monthly_payment = ((income / 12) - debt) * 0.4

		m = $max_monthly_payment
		r = 0.06
		n = 360

		$max_principle = (m * ((1 + r/12)**n - 1)) / ((r/12) * (1 + r/12)**n)

		$check_down_payment = (down_payment - $max_principle / 0.965 * 0.035)
			# Sees if they are limited by down payment. If limited by down payment, this is a negative number.

		$can_afford_income = $max_principle / 0.965 + (down_payment - $max_principle / 0.965 * 0.035)


		$can_afford_down = down_payment / 0.035

		if (income.to_i / 12) - debt <= 0 			# if they have more debt than income
			$your_number = down_payment
		elsif $check_down_payment >= 0 				# they have enough DP. they are limited by income.
			$your_number = $can_afford_income
		else
			$your_number = $can_afford_down			# they are limited by down payment.
		end



		# case

		# when $can_afford_income <= 0 		# income is limiting factor, and you don't have any income
		# 	$your_number = 0 

		# when @prequal.military				# if military, they have 0 down options, use income to determine.
		# 	$your_number = $can_afford_income

		# when @prequal.income.to_i < 90001 && @prequal.down_payment.to_i < 5001 # this is 0 down territory.
		# 	$your_number = $can_afford_income

		# when (income.to_i / 12) - debt <= 0  # their monthly income is less than their monthly debt
		# 	$your_number = down_payment      # all you can afford is what you have down. aka, no mortgage.
		# 	$prequal_status = 1

		# when $check_down_payment >= 0          # down payment is not limiting. Use income.
		# 	$your_number = $can_afford_income



		# when 
		# 	#$your_number = $can_afford_down
			
		# else
		# 	$your_number = "Sorry, an error has occured."
		# end
	end

	def display_guest(guest)
		guest_specs = [ guest.email, guest.name, guest.phone ]
		guest_specs.join(" | ")
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
