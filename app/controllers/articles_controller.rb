class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[index show]
  before_action :require_same_user, only: %i[edit update destroy]
  # index
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  # show
  def show; end

  # new
  def new
    @article = Article.new
  end

  # edit
  def edit; end

  # create
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article has been created'
      redirect_to(@article)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # update
  def update
    if @article.update(article_params)
      flash[:notice] = 'Article has been updated'
      redirect_to(@article)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  # destroy
  def destroy
    @article.destroy!
    flash[:notice] = 'Article has been deleted'
    redirect_to(articles_path)
  end

  private

  # get Article
  def set_article
    @article = Article.find(params[:id])
  end

  # article params
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  # require_same_user
  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = 'You can only edit your own article'
      redirect_to(@article)
    end
  end
end
