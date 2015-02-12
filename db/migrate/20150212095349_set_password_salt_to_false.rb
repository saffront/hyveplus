class SetPasswordSaltToFalse < ActiveRecord::Migration
  def change
    change_column :users, :crypted_password, :string, null: false
    change_column :users, :salt, :string, null: false
  end
end
