class CreateStoreItems < ActiveRecord::Migration[6.1]
  def change
    create_table :store_items do |t|
      t.integer "genre_id"
      t.string "name"
      t.integer "price"
      t.boolean "is_active", default: true
      t.integer "store_id"
      t.integer "item_id"
      t.timestamps
    end
  end
end
