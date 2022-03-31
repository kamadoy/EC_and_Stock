class RemoveStockToItemDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :item_details, :stock
  end
end
