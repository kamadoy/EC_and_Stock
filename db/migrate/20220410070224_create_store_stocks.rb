class CreateStoreStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :store_stocks do |t|
      t.integer "store_item_detail_id"
      t.integer "size"
      t.integer "stock"
      t.timestamps
    end
  end
end
