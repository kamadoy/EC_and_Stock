class RenameItemDetailIdColumnToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :item_detail_id, :size_stock_id
  end
end
