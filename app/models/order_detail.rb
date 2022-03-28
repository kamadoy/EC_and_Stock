class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item_detail
end
