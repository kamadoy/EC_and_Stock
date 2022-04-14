class Inventory < ApplicationRecord
     belongs_to :items
     belongs_to :stores
end
