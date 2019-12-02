class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def login
    @user = User.find(user_params)
    puts '-------------------------------------'
    puts @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
