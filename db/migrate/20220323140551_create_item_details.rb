class CreateItemDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :item_details do |t|
      t.integer :size,default: 0
      t.integer :color,default: 0
      t.string :stock


      t.timestamps
    end
  end
end
