class ProductPurchasesSendingDestination

  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :product_purchase_id, :postal_code, :shipping_area_id, :city, :addresses, :building, :phone_number, :token

  #sending_destinationsのバリデーション 
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_area_id
    validates :city
    validates :addresses
    validates :phone_number, format: { with:/\A[0-9]+\z/, less_than_or_equal_to: 11}
    end

  def save
    #product_purchasesの情報を保存し、product_purchasesという変数に入れる
    product_purchases = ProductPurchase.create(user_id: user_id, product_id: product_id)
    #sending_destinationsの情報を保存
    SendingDestination.create(product_purchase_id: product_purchases.id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, addresses: addresses, building: building, phone_number: phone_number)
  end
end