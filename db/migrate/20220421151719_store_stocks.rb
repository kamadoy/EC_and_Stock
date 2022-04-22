class StoreStocks < ActiveRecord::Migration[6.1]
  def change
    drop_table :store_stocks
  end
end
