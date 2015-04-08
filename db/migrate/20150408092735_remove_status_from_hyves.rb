class RemoveStatusFromHyves < ActiveRecord::Migration
  def change
    remove_column :hyves, :status
  end
end
