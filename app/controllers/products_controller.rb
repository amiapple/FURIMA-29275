class ProductsController < ApplicationController
  #商品一覧機能実装に使用
  #skip_before_action :authenticate_user!, only: :index

  #def index
    #@products = Product.order('created_at DESC')
  #end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :price, :category_id, :introduction, :condition_id, :postage_id, :shipping_area_id, :preparation_day_id).merge(user_id: current_user.id)
  end
end
