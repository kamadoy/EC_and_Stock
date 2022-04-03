class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def update_email
self.email = unconfirmed_email
self.unconfirmed_email = nil
self.bounce_email = false
skip_reconfirmation!
save
  end


         has_many :cart_items, dependent: :destroy
         has_many :addresses, dependent: :destroy
         has_many :orders, dependent: :destroy


        with_options presence: true do
        validates :email
        validates :last_name
        validates :first_name
        validates :last_name_kana
        validates :first_name_kana
        validates :address
        validates :postal_code
        validates :address
        validates :telephone_number
  end
end
