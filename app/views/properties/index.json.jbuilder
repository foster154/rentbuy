json.array!(@properties) do |property|
  json.extract! property, :id, :address, :beds, :baths, :payment, :area_id
  json.url property_url(property, format: :json)
end
