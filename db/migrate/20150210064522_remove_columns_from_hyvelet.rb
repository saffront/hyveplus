class RemoveColumnsFromHyvelet < ActiveRecord::Migration
  def change
  	remove_column :hyvelets, :ismissing, :boolean
  	remove_column :hyvelets, :isdestroyed, :boolean
  	add_column :hyvelets, :status, :string
  end
end
