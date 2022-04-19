class RenameInventorysColumnToItemId < ActiveRecord::Migration[6.1]
  def change
    rename_column :inventories, :item_id, :size_stock_id
  end
end
