class SizeStock < ApplicationRecord
    enum size: { SS: 0, S: 1,M: 2,L: 3, LL: 4}
     belongs_to :item_detail
     has_many :order_details, dependent: :destroy
     has_many :cart_items, dependent: :destroy
     has_many :inventories, dependent: :destroy
     validate :stock_consistency 

  # バリデーションメソッド
  def stock_consistency
    if stock <=0# バリデーションの条件
      errors.add(:size, "サイズの本社在庫数をオーバーしています") # エラーメッセージ
    end
  end
end
