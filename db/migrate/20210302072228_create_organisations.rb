class CreateOrganisations < ActiveRecord::Migration[6.1]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :address
      t.string :opening_time
      t.string :closing_time
      t.string :phone_number
      t.string :email_address
      t.string :website
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
