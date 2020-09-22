require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do

    it "すべての情報が正しいフォーマットで入力されていれば出品登録できる" do
      expect(@product).to be_valid
    end

    it "商品名が必須であること" do
      @product.name = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が必須であること" do
      @product.introduction = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Introduction can't be blank")
    end

     it "価格についての情報が必須であること" do
      @product.price = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が299以下であれば登録できないこと " do
      @product.price = "100"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格が10000000以上であれば登録できないこと " do
      @product.price = "20000000"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  
    it "発送元地域が---を示すid値だと出品登録できない" do
      @product.shipping_area_id= "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping area is not a number")
    end

    it "発送までの日数が---を示すid値だと出品登録できない" do
      @product.preparation_day_id= "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Preparation day is not a number")
    end

    it "配送料負担が---を示すid値だと出品登録できない" do
      @product.postage_id= "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Postage is not a number")
    end

    it "商品状態が---を示すid値だと出品登録できない" do
      @product.condition_id= "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Condition is not a number")
    end

    it "カテゴリーが---を示すid値だと出品登録できない" do
      @product.category_id= "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Category is not a number")
    end
  end
end