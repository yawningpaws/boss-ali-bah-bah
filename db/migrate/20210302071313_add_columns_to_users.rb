class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :identification_number, :string
    add_column :users, :name, :string
    add_column :users, :basic_salary, :float
    add_column :users, :hourly_salary, :float
  end
end
