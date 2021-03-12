class RemoveNullFalseInUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :identification_number
    change_column_null :users, :email, from: false, to: true
  end
end
