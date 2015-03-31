class RemoveDistanceNullFalseFromHyves < ActiveRecord::Migration
  def change
    change_column :hyves, :distance, :string, null: true
  end
end
