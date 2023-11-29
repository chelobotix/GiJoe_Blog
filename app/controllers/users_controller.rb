class UsersController < ApplicationController
  # new
  def new
    @user = User.new
  end

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

  private

  # user params
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
