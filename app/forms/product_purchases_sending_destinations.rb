class ProductPurchasesSendingDestinations

  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :product_purchases, :postal_code, :shipping_area_id, :city, :addresses, :building, :phone_number

  #sending_destinationsのバリデーション 
  with_options presence: true do
    validates :number, numericality: { with:/\A[0-9]+\z/}, length: { is: 16 }
    validates :exp_month, numericality: { with:/\A[0-9]+\z/, greater_than_or_equal_to: 1, less_than_or_equal_to: 2}
    validates :exp_year, numericality: { with:/\A[0-9]+\z/}, length: { is: 2 }
    validates :cvc, numericality: { with:/\A[0-9]+\z/}, length: { is: 3 }
    validates :postal_code,numericality: { /\A\d{3}[-]\d{4}\z/}
    validates :shipping_area_id
    validates :city
    validates :addresses
    validates :phone_number, numericality: { with:/\A[0-9]+\z/, less_than_or_equal_to: 11}
    end


end