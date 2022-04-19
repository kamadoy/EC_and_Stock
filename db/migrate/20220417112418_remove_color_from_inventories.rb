class RemoveColorFromInventories < ActiveRecord::Migration[6.1]
  def change
    remove_column :inventories, :color, :integer
  end
end
