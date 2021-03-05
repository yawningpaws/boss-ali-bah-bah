class AddColumnsToWorkdays < ActiveRecord::Migration[6.1]
  def change
    add_column :workdays, :start_time, :datetime
    add_column :workdays, :end_time, :datetime
    remove_column :workdays, :check_in_time
    remove_column :workdays, :check_out_time
  end
end
