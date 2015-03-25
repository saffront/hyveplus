class RenameHyveletMissingLocationsToHyveMissingLocations < ActiveRecord::Migration
  def change
    rename_table :hyvelet_missing_locations, :hyve_missing_locations
  end
end
