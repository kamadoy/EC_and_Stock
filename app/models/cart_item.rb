class CartItem < ApplicationRecord
  belongs_to :size_stock
  belongs_to :customer

  def sum_of_price
    size_stock.item_detail.item.taxin_price * amount
  end
  
  def item_order
    size_stock.item_detail.item
    
  end

  validates :amount, inclusion: { in: [1,2,3,4,5,6,7,8,9,10] }
end
