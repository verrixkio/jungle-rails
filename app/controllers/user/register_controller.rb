class User::RegisterController < ApplicationController

  def index
  end
  
  def new
    @user= User.new
  end

  def create
    @user = User.new(category_params)

    if @user.save
      redirect_to '/', notice: 'Registered!'
    else
      render :new
    end
  end
  def category_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end
end