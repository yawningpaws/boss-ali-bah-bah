class CreatePayslips < ActiveRecord::Migration[6.1]
  def change
    create_table :payslips do |t|
      t.references :user, null: false, foreign_key: true
      t.float :amount
      t.date :month
      t.string :payment_method

      t.timestamps
    end
  end
end
