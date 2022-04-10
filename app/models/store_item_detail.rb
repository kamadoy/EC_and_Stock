class StoreItemDetail < ApplicationRecord
    enum color: { ivory: 0, black: 1,brown: 2,navy: 3, gray: 4,red: 5,green: 6, yellow: 7}
    belongs_to :store_item
    has_many :store_stocks, dependent: :destroy
    accepts_nested_attributes_for :store_stocks, allow_destroy: true
    validates_associated :size_stocks
end
