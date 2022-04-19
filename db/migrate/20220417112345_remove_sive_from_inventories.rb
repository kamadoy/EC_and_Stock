class RemoveSiveFromInventories < ActiveRecord::Migration[6.1]
  def change
    remove_column :inventories, :size, :integer
  end
end
