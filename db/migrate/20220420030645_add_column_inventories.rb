class AddColumnInventories < ActiveRecord::Migration[6.1]
  def change
    add_column :inventories, :availability, :boolean, default: :true
  end
end
