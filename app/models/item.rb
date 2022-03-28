class Item < ApplicationRecord
  has_one_attached :image_id
  belongs_to :genre
  belongs_to :store
  has_many :item_details, dependent: :destroy
  accepts_nested_attributes_for :item_details
  def get_image_id(width, height)
    image_id.variant(resize_to_limit: [width, height]).processed
  end
     with_options presence: true do
        validates :name
        validates :introduction
        validates :price
        validates :image_id
      end
end
