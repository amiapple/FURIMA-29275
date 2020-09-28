require 'rails_helper'
RSpec.describe ProductPurchasesSendingDestination, type: :model do
  before do
    @product_purchases_sending_destination = FactoryBot.build(:product_purchases_sending_destination)
  end

  describe '商品購入機能' do

    it "すべての情報が正しいフォーマットで入力されていれば購入できる" do
      expect(@product_purchases_sending_destination).to be_valid
    end

    it "tokenが必須であること" do
      @product_purchases_sending_destination.token = ""
      @product_purchases_sending_destination.valid?
      expect(@product_purchases_sending_destination.errors.full_messages).to include("Token can't be blank")
    end
  
    it "郵便番号が必須であること" do
      @product_purchases_sending_destination.postal_code = ""
      @product_purchases_sending_destination.valid?
      expect(@product_purchases_sending_destination.errors.full_messages).to include("Postal code can't be blank")
    end

    it "都道府県が---を示すid値だと購入できない" do
      @product_purchases_sending_destination.shipping_area_id = 1
      @product_purchases_sending_destination.valid?
      expect(@product_purchases_sending_destination.errors.full_messages).to include("Shipping area must be other than 1")
    end
  
    it "市区町村が必須であること" do
      @product_purchases_sending_destination.city = ""
      @product_purchases_sending_destination.valid?
      expect(@product_purchases_sending_destination.errors.full_messages).to include("City can't be blank")
    end
  
    it "番地が必須であること" do
      @product_purchases_sending_destination.addresses = ""
      @product_purchases_sending_destination.valid?
      expect(@product_purchases_sending_destination.errors.full_messages).to include("Addresses can't be blank")
    end
  
    it "電話番号が必須であること" do
      @product_purchases_sending_destination.phone_number = ""
      @product_purchases_sending_destination.valid?
      expect(@product_purchases_sending_destination.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
