class User::LoginController < ApplicationController
  def index
  end

  def create
    puts 'these are our current', params
    redirect_to '/', notice: 'Logged in!'
  end

  def destroy
  end
end


