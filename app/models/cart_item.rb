class CartItem < ApplicationRecord
  belongs_to :size_stock
  belongs_to :customer

  def sum_of_price
    item.taxin_price * amount
  end

  validates :amount, inclusion: { in: [1,2,3,4,5,6,7,8,9,10] }
end
