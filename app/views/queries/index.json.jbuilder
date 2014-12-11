json.array!(@queries) do |query|
  json.extract! query, :id, :guest_id, :area_id, :payment
  json.url query_url(query, format: :json)
end
