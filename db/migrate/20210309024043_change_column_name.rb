class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :organisations, :lat, :latitude
    rename_column :organisations, :lng, :longitude
  end
end
