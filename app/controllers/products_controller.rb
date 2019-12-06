class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @users = User.all
    @user = User.new
    @product = Product.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def novedades
    @users = User.all
    @user = User.new
    @products = Product.all
  end

  def hombre
    @users = User.all
    @user = User.new
    @products = Product.all
  end

  def mujer
    @users = User.all
    @user = User.new
    @products = Product.all
  end

  def talla
    session[:talla] = params[:talla]
    puts '-------talla------'
    print session[:talla]
  end
  private

  def product_params
    params.require(:product).permit(:name, :description, :color, :price)
  end
end
