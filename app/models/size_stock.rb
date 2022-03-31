class SizeStock < ApplicationRecord
    enum size: { SS: 0, S: 1,M: 2,L: 3, LL: 4}
     belongs_to :item_detail
end
