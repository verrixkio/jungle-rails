class SessionsController < ApplicationController
  def new
    
  end
  def create
    user = User.find_by_email(user_params[:email])
    puts params, 'is this working outside?' 
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(user_params[:password])
      puts 'is this working in the if?' 
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      puts 'is this working in the else?'  
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
  private

  def user_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
end
