class CreateHyvelets < ActiveRecord::Migration
  def change
    create_table :hyvelets do |t|
      t.integer :user
      t.string :name
      t.string :pin
      t.float :lat, {:precision=>10, :scale=>6}
      t.float :lng, {:precision=>10, :scale=>6}

      t.timestamps null: false
    end
  end
end
