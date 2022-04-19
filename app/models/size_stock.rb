class SizeStock < ApplicationRecord
    enum size: { SS: 0, S: 1,M: 2,L: 3, LL: 4}
     belongs_to :item_detail
     has_many :order_details, dependent: :destroy
     has_many :cart_items, dependent: :destroy
     has_many :inventories, dependent: :destroy
end
