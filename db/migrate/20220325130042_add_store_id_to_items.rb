class AddStoreIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :store_id, :integer
  end
end
