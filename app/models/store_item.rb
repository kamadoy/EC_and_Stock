class StoreItem < ApplicationRecord
    has_one :item, dependent: :destroy
    has_many :store_item_details, dependent: :destroy
    accepts_nested_attributes_for :store_item_details, allow_destroy: true
    validates_associated :store_item_details
  
    def taxin_price
        price*1.1
    end
end
