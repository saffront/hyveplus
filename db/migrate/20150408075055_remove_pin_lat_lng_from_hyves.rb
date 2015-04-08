class RemovePinLatLngFromHyves < ActiveRecord::Migration
  def change
    remove_column :hyves, :pin
    remove_column :hyves, :lat
    remove_column :hyves, :lng
  end
end
