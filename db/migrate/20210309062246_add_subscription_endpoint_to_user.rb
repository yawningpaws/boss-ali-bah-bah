class AddSubscriptionEndpointToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscription, :jsonb
  end
end
