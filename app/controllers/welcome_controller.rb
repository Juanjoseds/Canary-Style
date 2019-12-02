class WelcomeController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      render 'welcome/index'
    else
      render :'welcome/index'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
