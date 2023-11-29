class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  # new
  def new
    @user = User.new
  end

  # edit
  def edit; end

  # create
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User #{@user.username} has been created"
      redirect_to(articles_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # update
  def update
    if @user.update(user_params)
      flash[:notice] = 'User has been updated'
      redirect_to(articles_path)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  private

  # get user
  def set_user
    @user = User.find(params[:id])
  end

  # user params
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
