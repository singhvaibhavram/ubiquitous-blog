class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  # Display  all Users
  def index
    @users = User.all
  end
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
  end

  # Update Edited Users
  def update
    if @user.update(user_params)
      flash[:success] = "Hey #{@user.username}, your account was updated successfully!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  # Show Users
  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end
