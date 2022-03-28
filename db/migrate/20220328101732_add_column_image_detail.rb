class AddColumnImageDetail < ActiveRecord::Migration[6.1]
  def change
    add_column :item_details, :item_id, :integer
  end
end
