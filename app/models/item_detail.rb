class ItemDetail < ApplicationRecord
  enum color: { ivory: 0, black: 1,brown: 2,navy: 3, gray: 4,red: 5,green: 6, yellow: 7}
  has_one_attached :image_detail_id
  belongs_to :item
  has_many :size_stocks, dependent: :destroy
  accepts_nested_attributes_for :size_stocks, allow_destroy: true
  validates_associated :size_stocks
  
  def get_image_detail_id(width, height)
    image_detail_id.variant(resize_to_limit: [width, height]).processed
  end

  def taxin_price
        price*1.1
  end
end
