class RemoveSizeToItemDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :item_details, :size
  end
end
