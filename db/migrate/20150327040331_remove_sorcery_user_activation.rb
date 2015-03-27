class RemoveSorceryUserActivation < ActiveRecord::Migration
  def change
    remove_index :users, :activation_token
    remove_column :users, :activation_token_expires_at
    remove_column :users, :activation_token
    remove_column :users, :activation_state
  end
end
