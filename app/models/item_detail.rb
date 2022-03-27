class ItemDetail < ApplicationRecord
  enum color: { ivory: 0, black: 1,brown: 2,navy: 3, gray: 4,red: 5,green: 6, yellow: 7}
  has_one_attached :image_id
  belongs_to :item
  has_many :cart_items, dependent: :destroy
  has_many :order_datiles, dependent: :destroy

  def taxin_price
        price*1.08
  end
end
