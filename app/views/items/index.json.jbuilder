json.array!(@items) do |item|
  json.extract! item, :id, :name, :price
  json.url item_url(item, format: :json)
end
