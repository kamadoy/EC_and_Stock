class Address < ApplicationRecord
  belongs_to :customer
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
  with_options presence: true do
  validates :name
  validates :postal_code
  validates :address
  end
end
