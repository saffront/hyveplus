class AddColumnsToHyvelet < ActiveRecord::Migration
  def change
    add_column :hyvelets, :ismissing, :boolean
    add_column :hyvelets, :isdestroyed, :boolean
  end
end
