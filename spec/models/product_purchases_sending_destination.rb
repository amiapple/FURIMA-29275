require 'rails_helper'
RSpec.describe SendingDestination, type: :model do
  before do
    @sending_destination = FactoryBot.build(:sending_destination)
  end

  describe '商品購入機能' do

    it "すべての情報が正しいフォーマットで入力されていれば購入できる" do
      expect(@sending_destination).to be_valid
    end
  
    it "郵便番号が必須であること" do
      @sending_destination.postal_code = ""
      @sending_destination.valid?
      expect(@sending_destination.errors.full_messages).to include("Postal code can't be blank")
    end

    it "都道府県が---を示すid値だと購入できない" do
      @sending_destination.shipping_area_id = 1
      @sending_destination.valid?
      expect(@sending_destination.errors.full_messages).to include("Shipping_area_id is not a number")
    end
  
    it "市区町村が必須であること" do
      @sending_destination.city = ""
      @sending_destination.valid?
      expect(@sending_destination.errors.full_messages).to include("City can't be blank")
    end
  
    it "番地が必須であること" do
      @sending_destination.addresses = ""
      @sending_destination.valid?
      expect(@sending_destination.errors.full_messages).to include("Addresses can't be blank")
    end
  
    it "電話番号が必須であること" do
      @sending_destination.phone_number = ""
      @sending_destination.valid?
      expect(@sending_destination.errors.full_messages).to include("Phone number can't be blank")
    end
  
    it "郵便番号にはハイフンが必要であること" do
      @sending_destination.postal_code  = "-"
      @sending_destination.valid?
      expect(@sending_destination.errors.full_messages).to include("Postal code is invalid")
    end
  
    it "電話番号は11桁以内であること" do
      @sending_destination.phone_number = ""
      @sending_destination.valid?
      expect(@sending_destination.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
