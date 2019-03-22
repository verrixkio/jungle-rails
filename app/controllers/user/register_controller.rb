class User::RegisterController < ApplicationController

  def index
  end
  
  def new
    user= User.new
  end

  def create
    user = User.new(category_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private
  
  def category_params
    params.require(:user).permit(
      :name,
      :email,
      :password
    )
  end
end