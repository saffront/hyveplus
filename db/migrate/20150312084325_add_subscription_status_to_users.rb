class AddSubscriptionStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription, :boolean, default: false
  end
end
