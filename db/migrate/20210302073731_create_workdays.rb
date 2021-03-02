class CreateWorkdays < ActiveRecord::Migration[6.1]
  def change
    create_table :workdays do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.time :check_in_time
      t.time :check_out_time
      t.boolean :on_rest
      t.boolean :on_mc
      t.references :accident, null: false, foreign_key: true

      t.timestamps
    end
  end
end
