class RemoveMasterPinsAndHyveMissingLocations < ActiveRecord::Migration
  def change
    drop_table :master_pins
    drop_table :hyve_missing_locations
  end
end
