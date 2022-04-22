class Item < ApplicationRecord
  has_one_attached :image_id
  belongs_to :genre
  has_many :item_details, dependent: :destroy
  has_many :size_stocks, through: :item_details
  accepts_nested_attributes_for :item_details, allow_destroy: true
  validates_associated :item_details
  

    
  def get_image_id(width, height)
    image_id.variant(resize_to_limit: [width, height]).processed
  end
  
  def taxin_price
        price*1.1
  end
  
     with_options presence: true do
        validates :name
        validates :introduction
        validates :price
        validates :image_id
      end
end
