class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
  end

  def show
    index
    session[:uservista] = 0
  end

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
      session[:userid] = @db_id
      session[:name] = @db_name
      session[:cart] ||= []
      session[:tallacesta] ||= []
      session[:talla_camiseta] = @db['talla_camiseta']
      session[:talla_pie] = @db['talla_pie']
      session[:talla_pantalon] = @db['talla_pantalon']
      session[:ciudad] = @db['ciudad']
      session[:direccion] = @db['direccion']
      session[:phone] = @db['phone']

    end
    redirect_to request.referer.present? ? request.referer : default_path
  end

  # LIMPIAMOS LAS VARIABLES DE SESIÓN UTILIZADAS
  def logout
    session[:username] = nil
    session[:userid] = nil
    session[:name] = nil
    session[:cart] = nil
    session[:tallacesta] = nil
    session[:talla_camiseta] = nil
    session[:talla_pie] = nil
    session[:talla_pantalon] = nil
    redirect_to request.referer.present? ? request.referer : default_path
  end

  # ALMACENAMOS EN SESSION LOS ELEMENTOS QUE HA AÑADIDO EL USUARIO
  def carritoadd
    session[:cart].push(params[:id])
    session[:tallacesta].push(session[:talla])
  end

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
    redirect_to request.referer.present? ? request.referer : default_path
  end

  def option3
    session[:option] = 3
    redirect_to request.referer.present? ? request.referer : default_path
  end

end
