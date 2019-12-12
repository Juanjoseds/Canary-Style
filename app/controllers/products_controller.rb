class ProductsController < ApplicationController
  def index
    setUser
    @products = Product.all
  end

  def new
    setUser
    @product = Product.new
    @talla_xs = nil
    @talla_s = nil
    @talla_m = nil
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
    setUser
    @product = Product.find(params[:id])
  end

  def update

    @product = Product.find(params[:id])
    
    unless params[:image].blank?
      @product.image.attach(params[:image])
    end

    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to mainadmin_path
  end

  def search
    setUser
    @products = Product.where(["name ILIKE ?","%#{params[:search]}%"])

    render 'products/search'
  end

  def searchadmin
    setUser
    @products = Product.where(["name ILIKE ?","%#{params[:search]}%"])
    puts '------------SEARCH ADMIN----------------'
    render 'products/index'
  end

  def novedades
    setUser
    @products = Product.all
    @products = Product.order('created_at DESC')
    session[:talla] = nil
  end

  def hombre
    setUser
    @products = Product.all
    session[:talla] = nil
  end

  def mujer
    setUser
    @products = Product.all
    session[:talla] = nil
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
    params.require(:product).permit(:name, :description, :color, :price, :rgb,
                                    :genero, :offer, :image, talla:[])
  end
end
