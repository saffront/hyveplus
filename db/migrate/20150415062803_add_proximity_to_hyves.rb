class AddProximityToHyves < ActiveRecord::Migration
  def change
    add_column :hyves, :proximity, :string
  end
end
