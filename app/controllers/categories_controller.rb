class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :require_admin, except: %i[index show]
  # action``
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  # action
  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  # action
  def new
    @category = Category.new
  end

  # action
  def edit; end

  # action
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category has been created'
      redirect_to(@category)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # action
  def update; end

  # action
  def destroy; end

  private

  # get Category
  def set_category
    @category = Category.find(params[:id])
  end

  # category params
  def category_params
    params.require(:category).permit(:name)
  end

  # require_user
  def require_admin
    unless logged_in? && current_user.admin?
      flash[:alert] = 'Only Admins can performs that action'
      redirect_to(categories_path)
    end
  end
end
