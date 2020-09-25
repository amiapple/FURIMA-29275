class ProductPurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @product_purchases = Product.new
    @products = Product.find(params[:product_id])
  end

  def create
    @products = Product.find(params[:product_id])
    @product_purchases = ProductPurchases.new(product_purchases_params)
    if @product_purchases.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def product_purchases_params
    params.require(:product_purchases).permit(:user_id, :product_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_bc6318f2bf26c3ca7a25bc0a"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end