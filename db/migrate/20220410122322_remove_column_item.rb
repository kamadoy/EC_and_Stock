class RemoveColumnItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :store_id, :integer
  end
end
