class ChangeColumnsInWorkdays < ActiveRecord::Migration[6.1]
  def change
    change_column_default :workdays, :on_rest, from: nil, to: false
    change_column_default :workdays, :on_mc, from: nil, to: false
    change_column_null :workdays, :accident_id, from: false, to: true
  end
end
