json.array!(@wines) do |wine|
  json.extract! wine, :id, :short_description, :bottle_size, :price, :long_description, :origin_country, :company, :grape_type, :is_vegetarian, :picture_id
  json.url wine_url(wine, format: :json)
end
