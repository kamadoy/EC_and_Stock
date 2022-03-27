class Address < ApplicationRecord
  belongs_to :customer
  def adress_display
  '〒' + postal_code + ' ' + adress + ' ' + name
  end
  with_options presence: true do
  validates :name
  validates :postal_code
  validates :address
  end
end
