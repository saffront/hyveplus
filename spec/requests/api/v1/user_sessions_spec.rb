#require 'spec_helper'

#describe 'GET /v1/events/:id' do
  #it 'returns an event by :id' do
    #event = create(:event)
    #get "/v1/events/#{event.id}"
    #expect(response_json).to eq( {
      #'address' => event.address,
      #'ended_at' => event.ended_at,
      #'id' => event.id,
      #'lat' => event.lat,
      #'lon' => event.lon,
      #'name' => event.name,
      #'started_at' => event.started_at.iso8601(3),
      #'owner' => { 'device_token' => event.owner.device_token }
    #} )
  #end
#end
