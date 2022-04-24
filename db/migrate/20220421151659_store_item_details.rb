class StoreItemDetails < ActiveRecord::Migration[6.1]
  def up
    drop_table :store_item_details
  end
  
  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
