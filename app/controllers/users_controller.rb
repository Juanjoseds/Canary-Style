class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
    @userdata = User.new
  end

  def new
    @user = User.new
  end

  def show
    index
  end

  def create
    puts '-------VALE CREANDO---------'
    @user = User.new(user_params)
    if @user.save
      redirect_to main_path
    else
      redirect_to request.referer.present? ? request.referer : default_path
    end
  end

  # ACTUALIZA LOS DATOS DEL USUARIO EN EL SERVIDOR
  def update
    print params[:id]
    print params[:user]['username']

    @userdata = User.where(id: params[:id]).take
    if @userdata.update(user_params)
      #Actualizamos las variables necesarias
      refresh
      redirect_to request.referer.present? ? request.referer : default_path
    else
      redirect_to request.referer.present? ? request.referer : default_path
    end
  end

  def refresh
    session[:name] = @userdata['name']
    session[:direccion] = @userdata['direccion']
    session[:ciudad] = @userdata['ciudad']
    session[:pais] = @userdata['pais']
    session[:phone] = @userdata['phone']
    session[:talla_camiseta] = @userdata['talla_camiseta']
    session[:talla_pie] = @userdata['talla_pie']
    session[:talla_chandal] = @userdata['talla_chandal']
    session[:talla_pantalon] = @userdata['talla_pantalon']
    puts '----------REFRESH-------'
    print @userdata['talla_camiseta']
  end
  # Comprueba los datos que ha introducido el usuario con los del servidor
  def login
    @user = params[:user]['username']
    @password = params[:user]['password']

    @db = User.where(username: @user).take
    @db_user = @db['username']
    @db_password = @db['password']
    @db_id = @db['id']
    @db_name = @db['name']

    if @user == @db_user && @password == @db_password
      session[:username] = @db_user
      session[:admin] = @db['admin']
      session[:userid] = @db_id
      session[:name] = @db_name
      session[:cart] ||= []
      session[:tallacesta] ||= []
      session[:talla_camiseta] = @db['talla_camiseta']
      session[:talla_pie] = @db['talla_pie']
      session[:talla_pantalon] = @db['talla_pantalon']
      session[:talla_chandal] = @db['talla_chandal']
      session[:ciudad] = @db['ciudad']
      session[:direccion] = @db['direccion']
      session[:phone] = @db['phone']
      session[:pais] = @db['pais']
      session[:option] = 1
    end
    redirect_to request.referer.present? ? request.referer : default_path
  end

  # Limpiamos las variables de sesión utilizadas
  def logout
    session[:username] = nil
    session[:admin] = nil
    session[:userid] = nil
    session[:name] = nil
    session[:cart] = nil
    session[:tallacesta] = nil
    session[:talla_camiseta] = nil
    session[:talla_pie] = nil
    session[:talla_chandal] = nil
    session[:talla_pantalon] = nil
    redirect_to request.referer.present? ? request.referer : default_path
  end

  # Almacenamos en variable de sesión los elementos que ha añadido el usuario al carrito
  def carritoadd
    session[:cart].push(params[:id])
    session[:tallacesta].push(session[:talla])
    session[:talla] = nil
  end

  # Borramos el elemento que el usuario ha elegido
  def deletecarrito
    puts '------DELETE-----'
    session[:cart].delete_at(params[:index].to_i)
    session[:tallacesta].delete_at(params[:index].to_i)
    redirect_to request.referer.present? ? request.referer : default_path
  end

  def cesta
    index
  end

  def option1
    session[:option] = 1
    redirect_to request.referer.present? ? request.referer : default_path
  end

  def option2
    session[:option] = 2
    @userdata = User.find(session[:userid])
    print @userdata['name']

    redirect_to request.referer.present? ? request.referer : default_path
  end

  def option3
    session[:option] = 3
    redirect_to request.referer.present? ? request.referer : default_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :admin,
                                  :username, :password, :talla_pie,
                                  :talla_camiseta, :talla_pantalon,
                                  :talla_chandal, :ciudad, :phone, :pais, :direccion)
  end
end
