class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :order_details
  belongs_to :customer
  attribute :select_address, type: Integer ,default: "0"
  attribute :address_id, type: Integer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { weiting_deposit: 0, payment_confimation: 1,ready_ship: 2,sent: 3 }
end
