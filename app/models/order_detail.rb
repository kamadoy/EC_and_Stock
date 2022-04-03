class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :size_stock
end
