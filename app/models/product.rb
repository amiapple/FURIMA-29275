class Product < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one :product_purchase
  
end
