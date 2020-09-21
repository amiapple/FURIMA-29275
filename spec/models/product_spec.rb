require 'rails_helper'
RSpec.describe Product, type: :model do
before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do

    it "商品名が必須であること" do
      @product.name = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("name can't be blank")
    end

    it "商品の説明が必須であること" do
      @product.introduction = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("introduction can't be blank")
    end

     it "価格についての情報が必須であること" do
      @product.price = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("price can't be blank")
    end

    it "価格が299以下であれば登録できないこと " do
      item = build(:item, price: 299 )
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "価格が10000000以上であれば登録できないこと " do
      item = build(:item, price: 10000000 )
      item.valid?
      expect(item.errors[:price]).to include("は10000000以下の値にしてください")
    end

    it "発送元の地域についての情報が必須であること" do
      @product.shipping_area_id = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("shipping can't be blank")
     end

     it "発送までの日数についての情報が必須であること" do
      @product.preparation_day_id = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("shipping can't be blank")
    end

    it "配送料の負担についての情報が必須であること" do
      @product.postage_id = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("postage can't be blank")
    end

    it "商品の状態についての情報が必須であること" do
      @product.condition_id = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("condition can't be blank")
    end

    t "カテゴリーの情報が必須であること" do
      @product.category_id = ""
      @user.valid?
      expect(@product.errors.full_messages).to include("category can't be blank")
    end
  end