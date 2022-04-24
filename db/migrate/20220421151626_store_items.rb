class StoreItems < ActiveRecord::Migration[6.1]
  def up
    drop_table :store_items
  end
  
  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
