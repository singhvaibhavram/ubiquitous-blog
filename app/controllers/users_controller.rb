class UsersController < ApplicationController
  # New User
  def new
    @user = User.new
  end
  # On New User Submit
  def create
    @user = User.new(user_params)
    # Saving User to Database
    if @user.save
      flash[:success] = "Welcome to Wandering Albus #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
