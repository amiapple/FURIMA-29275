class ProductPurchase < ApplicationRecord
  belongs_to :user
  belongs_to :products
  has_one :product_purchase

  validates :number, presence: true
  validates :exp_month, presence: true
  validates :exp_year, presence: true
  validates :cvc, presence: true
  validates :postal_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :addresses, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
end
