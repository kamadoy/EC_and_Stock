class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :size_stock
  def item_order
    size_stock.item_detail.item
    
  end
end
