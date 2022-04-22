class StoreItems < ActiveRecord::Migration[6.1]
  def change
    drop_table :store_items
  end
end
