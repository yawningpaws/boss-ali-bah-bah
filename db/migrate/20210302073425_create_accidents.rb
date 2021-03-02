class CreateAccidents < ActiveRecord::Migration[6.1]
  def change
    create_table :accidents do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.date :date
      t.string :time
      t.string :injured_part
      t.boolean :paid_by_employer
      t.string :medical_facility

      t.timestamps
    end
  end
end
