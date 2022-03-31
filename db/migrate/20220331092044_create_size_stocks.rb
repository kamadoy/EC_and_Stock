class CreateSizeStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :size_stocks do |t|
      t.integer :item_detail_id
      t.integer :size
      t.integer :stock

      t.timestamps
    end
  end
end
