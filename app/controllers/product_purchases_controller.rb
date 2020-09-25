class ProductPurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @product_purchases = Product.find(params[:product_id])
    @products = Product.find(params[:product_id])
  end

  private
  def product_purchases_params
    params.require(:product_purchases).permit(:user_id, :product_id).merge(user_id: current_user.id)
  end
end



  
