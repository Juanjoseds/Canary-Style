class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
  end

  def login
    # @user = User.find(user_params)
    @user = params[:user]["username"]
    @password = params[:user]["password"]

    @db = User.where(username: @user).take
    @db_user = @db["username"]
    @db_password = @db["password"]
    @db_id = @db["id"]

    if @user == @db_user && @password == @db_password
      session[:username] = @db_user
      session[:userid] = @db_id
    end

    puts '-----------SESSION-------------------'
    puts session[:userid]
    puts '-------------------------------------'
    puts @user + " " + @password
    puts @db["username"]
    # puts user_params
    puts '-------------------------------------'
      redirect_to main_path
  end

end
