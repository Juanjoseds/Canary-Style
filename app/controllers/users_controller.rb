class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
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

    end

    puts '-----------SESSION-------------------'
    puts session[:name]
    puts '-------------------------------------'
    puts @user + ' ' + @password
    puts @db['username']
    # puts user_params
    puts '-------------------------------------'
      redirect_to main_path
  end

  def logout
    session[:username] = nil
    session[:userid] = nil
    session[:cart] = nil
    session[:tallacesta] = nil
    redirect_to main_path
  end

  # ALMACENAMOS EN SESSION LOS ELEMENTOS QUE HA AÑADIDO EL USUARIO
  def carritoadd
    session[:cart].push(params[:id])
    session[:tallacesta].push(session[:talla])
    #DEBUG
    puts '-------SE HA AÑADIDO AL CARRITO------------'
    print session[:cart]
    print session[:tallacesta]
  end

  def deletecarrito
    puts '------DELETE-----'
    session[:cart].delete_at(params[:index].to_i)
    redirect_to request.referer.present? ? request.referer : default_path
  end

  def cesta
    index

  end

end
