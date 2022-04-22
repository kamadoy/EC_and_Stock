class Inventory < ApplicationRecord
     belongs_to :size_stock
     belongs_to :store
     
     with_options presence: true do
   validates :quantity
   validates :availability, inclusion: { in: [true, false] }
  end
end
