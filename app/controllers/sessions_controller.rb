class SessionsController < ApplicationController
  # Login Form
  def new
  end
  # Post Method to login
  def create
    # Search User
    user = User.find_by(email: params[:session][:email].downcase)
    # If User is found and Password authentication
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfuly Logged In."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Login Credentials were Wrong!!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:warning] = "You have been Logged Out."
    redirect_to root_path
  end

end
