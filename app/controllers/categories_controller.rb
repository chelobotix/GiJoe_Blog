class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  # action``
  def index; end

  # action
  def show; end

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
end
