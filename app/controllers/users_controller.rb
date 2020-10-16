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

  # Edit Users
  def edit
    @user = User.find(params[:id])
  end

  # Update Edited Users
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Hey #{@user.username}, your account was updated successfully!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  # Show Users
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
