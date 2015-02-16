class AddHyveletRefToHyveletmissing < ActiveRecord::Migration
  def change
  	remove_column :hyvelet_missing_locations, :hyvelet_id, :integer
    add_reference :hyvelet_missing_locations, :hyvelet, index: true
    add_foreign_key :hyvelet_missing_locations, :hyvelets
  end
end
