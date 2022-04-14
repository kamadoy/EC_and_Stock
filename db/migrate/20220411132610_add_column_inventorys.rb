class AddColumnInventorys < ActiveRecord::Migration[6.1]
  def change
    add_column :inventories, :quantity, :integer
  end
end
