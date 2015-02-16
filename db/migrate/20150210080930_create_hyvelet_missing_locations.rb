class CreateHyveletMissingLocations < ActiveRecord::Migration
  def change
    create_table :hyvelet_missing_locations do |t|
      t.string :deviceid
      t.float :lat, {:precision=>10, :scale=>6}
      t.float :lng, {:precision=>10, :scale=>6}
      t.integer :hyvelet_id

      t.timestamps null: false
    end
  end
end
