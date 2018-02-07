class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def description
    @product = Product.find(params[:id])
    render plain: @product.description
  end

  def inventory
    @product = Product.find(params[:id])
    if @product.inventory != nil
      if @product.inventory > 0
        result = true
      else
        result = false
      end
    else
      result = false
    end
    render plain:"#{result}"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :inventory)
  end

end
