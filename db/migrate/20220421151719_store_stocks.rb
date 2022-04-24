class StoreStocks < ActiveRecord::Migration[6.1]
  def up
    drop_table :store_stocks
  end
  
  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
