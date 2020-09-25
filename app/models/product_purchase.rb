class ProductPurchase < ApplicationRecord
  belongs_to :user
  belongs_to :products
  has_one :product_purchases

  
end
