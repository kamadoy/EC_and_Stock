class ChangeColumnInventories < ActiveRecord::Migration[6.1]
  def change
     change_column_default :inventories, :availability, from: true, to: false
  end
end
