json.array!(@items) do |item|
  json.extract! item, :id, :item, :description
  json.url item_url(item, format: :json)
end
