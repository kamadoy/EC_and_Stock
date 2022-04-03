class RenameItemDetailIdColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :item_detail_id, :size_stock_id
  end
end
