class ChangeColumnsInPayslips < ActiveRecord::Migration[6.1]
  def change
    remove_column :payslips, :month_year
    add_column :payslips, :month, :integer
    add_column :payslips, :year, :integer
  end
end
