class CreateMasterPins < ActiveRecord::Migration
  def change
    create_table :master_pins do |t|
      t.string :manufacturer
      t.string :serialnumber
      t.string :pin

      t.timestamps null: false
    end
  end
end
