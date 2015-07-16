module ApplicationHelper
	def sortable(column, title = nil)
		title ||= column.titleize
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, sort: column, direction: direction
	end

	def rb_calculator(income, debt, down_payment)
		income = income.to_i
		debt = debt.to_i
		down_payment = down_payment.to_i

		max_monthly_payment = ((income / 12) - debt) * 0.38
		fha_r = @apr + @ti + 0.0085
		conv_r = @apr + @ti + 0.0059
		term = 360

		@max_fha_principle = (max_monthly_payment * ((1 + fha_r/12)**term - 1)) / ((fha_r/12) * (1 + fha_r/12)**term)

		@max_conv_principle = (max_monthly_payment * ((1 + conv_r/12)**term - 1)) / ((conv_r/12) * (1 + conv_r/12)**term)

	end
	
end
