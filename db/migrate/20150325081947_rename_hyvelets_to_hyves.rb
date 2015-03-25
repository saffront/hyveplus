class RenameHyveletsToHyves < ActiveRecord::Migration
  def change
    rename_table :hyvelets, :hyves
  end
end
