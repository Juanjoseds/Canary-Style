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
    setUser
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
    setUser
    @products = Product.all
  end

  def hombre
    setUser
    @products = Product.all
  end

  def mujer
    setUser
    @products = Product.all
  end

  def setUser
    @users = User.all
    @user = User.new
  end

  def talla
    session[:talla] = params[:talla]
    puts '-------talla------'
    print session[:talla]
    redirect_to request.referer.present? ? request.referer : default_path
  end

  def buy
    redirect_to request.referer.present? ? request.referer : default_path
  end
  private

  def product_params
    params.require(:product).permit(:name, :description, :color, :price)
  end
end
