class AddDistanceUuidImageToHyvelets < ActiveRecord::Migration
  def change
    add_column :hyvelets, :distance, :integer, null: false 
    add_column :hyvelets, :uuid, :string, null: false
    add_column :hyvelets, :image, :string
  end
end
