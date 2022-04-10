class CreateStoreItemDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :store_item_details do |t|
      t.integer "color", default: 0
      t.integer "store_item_id"
      t.timestamps
    end
  end
end
