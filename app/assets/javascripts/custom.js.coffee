jQuery ->

	$("#guest_queries_attributes_0_payment").payment "restrictNumeric"
	$("#query_payment").payment "restrictNumeric"
	$('input[data-role=money]').autoNumeric('init', {vMin: '1', vMax: '9999999'})
	$('.has-popover').popover trigger: 'hover'
