class RemoveColumnHyvelets < ActiveRecord::Migration
  def change
  	remove_column :hyvelets, :user, :integer
  	add_column :hyvelets, :user_id, :integer
  end
end
