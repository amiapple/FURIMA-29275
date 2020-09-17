class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index 

  def index
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
    params.require(:products).permit(:image).merge(user_id: current_user.id)
  end

end
