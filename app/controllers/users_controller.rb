class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_user, except: %i[index show new create]
  before_action :require_same_user, only: %i[edit update destroy]
  before_action :already_singed_up, only: %i[new]
  # index
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  # show
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
      flash[:notice] = "User #{@user.username} has been created, please log in"
      redirect_to(login_path)
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

  # destroy
  def destroy
    @user.destroy!
    flash[:notice] = 'Account and all associated articles have been deleted'
    unless current_user.admin?
      session[:user_id] = nil
      redirect_to(root_path)
    end
    redirect_to(users_path)
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

  # require_same_user
  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = 'You cant edit or delete this user'
      redirect_to(@user)

    end
  end

  # require_same_user
  def already_singed_up
    if logged_in?
      flash[:alert] = 'You have already signed up'
      redirect_to(current_user)

    end
  end
end
