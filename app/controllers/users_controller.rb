class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
  end

  def login
    @user = params[:user]["username"]
    @password = params[:user]["password"]

    @db = User.where(username: @user).take
    @db_user = @db["username"]
    @db_password = @db["password"]
    @db_id = @db["id"]
    @db_name = @db["name"]

    if @user == @db_user && @password == @db_password
      session[:username] = @db_user
      session[:userid] = @db_id
      session[:name] = @db_name
      session[:cart] ||= []
    end

    puts '-----------SESSION-------------------'
    puts session[:name]
    puts '-------------------------------------'
    puts @user + " " + @password
    puts @db["username"]
    # puts user_params
    puts '-------------------------------------'
      redirect_to main_path
  end

  def logout
    session[:username] = nil
    session[:userid] = nil
    session[:cart] = nil
    print session[:cart]
    redirect_to main_path
  end

  # ALMACENAMOS EN SESSION LOS ELEMENTOS QUE HA AÑADIDO EL USUARIO
  def carritoadd
    session[:cart].push(params[:id])

    #DEBUG
    puts '-------SE HA AÑADIDO AL CARRITO------------'
    print session[:cart]
  end

end
