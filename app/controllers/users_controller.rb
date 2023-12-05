class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  # index
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  # new
  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end

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
      redirect_to(users_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # update
  def update
    if @user.update(user_params)
      flash[:notice] = 'User has been updated'
      redirect_to(@user)
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
