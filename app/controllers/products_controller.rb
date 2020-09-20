class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index 

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(product_params)
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

  def products_params
    params.require(:products).permit(:image,:category_id).merge(user_id: current_user.id)
  end

end
