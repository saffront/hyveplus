json.array!(@hyvelet_missing_locations) do |hyvelet_missing_location|
  json.extract! hyvelet_missing_location, :id, :deviceid, :lat, :lng, :hyvelet_id
  json.url hyvelet_missing_location_url(hyvelet_missing_location, format: :json)
end
