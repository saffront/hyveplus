json.array!(@master_pins) do |master_pin|
  json.extract! master_pin, :id, :manufacturer, :serialnumber, :pin
  json.url master_pin_url(master_pin, format: :json)
end
