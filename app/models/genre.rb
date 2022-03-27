class Genre < ApplicationRecord
      has_many :items, dependent: :destroy

with_options presence: true do
        validates :name
end
end
