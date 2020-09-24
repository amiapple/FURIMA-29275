class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_product, only: [:edit, :update, :show]
  def index
    @products = Product.all.order('created_at DESC')
  end

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
    if @product.update(product_params)
     redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :price, :category_id, :introduction, :condition_id, :postage_id, :shipping_area_id, :preparation_day_id).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
