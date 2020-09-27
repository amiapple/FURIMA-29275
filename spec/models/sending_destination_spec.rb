require 'rails_helper'
RSpec.describe SendingDestination, type: :model do
  before do
    @sending_destination = FactoryBot.build(:sending_destination)
  end

  describe '商品購入機能' do

    it "すべての情報が正しいフォーマットで入力されていれば購入できる" do
      binding.pry
      expect(@sending_destination).to be_valid
    end
  
    it "郵便番号が必須であること" do
      @sending_destination.postal_code = ""
      @sending_destination.valid?
    end
   
  end
end
