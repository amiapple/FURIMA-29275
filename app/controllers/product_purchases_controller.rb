class ProductPurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @product_purchases = ProductPurchasesSendingDestination.new
    @products = Product.find(params[:product_id])
  end

  def create
    @products = Product.find(params[:product_id])
    @product_purchases = ProductPurchasesSendingDestination.new(product_purchases_params)
    if @product_purchases.valid?
      pay_item
      @product_purchases.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def product_purchases_params
    params.require(:product_purchases_sending_destination).permit(:postal_code, :shipping_area_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id,token: params[:token], product_id: params[:product_id])
  end

  def pay_item
    @product = Product.find(params[:product_id])
    payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: product_purchases_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end