class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  # create products
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(get_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  #show prducts
  def index
    @products = Product.order(created_at: :DESC);
  end

  #show single product
  def show
  end

  #edit
  def edit
  end

  def update
    if @product.update(get_params)
      redirect_to product_path(@product)
    else
      render :edit
    end

  end

  #delete
  def destroy
      @product.destroy
      redirect_to products_path
  end

  private 
  def find_product
    @product = Product.find(params[:id])
  end

  def get_params
      params.require(:product).permit(:title, :description, :price)
  end

end
