class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer "store_id"
      t.integer "item_id"
      t.integer "color"
      t.integer "size"
      t.timestamps
    end
  end
end
