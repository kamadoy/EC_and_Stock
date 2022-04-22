class StoreItemDetails < ActiveRecord::Migration[6.1]
  def change
    drop_table :store_item_details
  end
end
