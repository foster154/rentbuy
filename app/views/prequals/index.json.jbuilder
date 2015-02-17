json.array!(@prequals) do |prequal|
  json.extract! prequal, :id, :guest_id, :income, :debt, :down_payment
  json.url prequal_url(prequal, format: :json)
end
