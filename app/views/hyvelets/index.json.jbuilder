json.array!(@hyvelets) do |hyvelet|
  json.extract! hyvelet, :id, :user, :name, :pin, :lat, :lng
  json.url hyvelet_url(hyvelet, format: :json)
end
