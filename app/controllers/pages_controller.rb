class PagesController < ApplicationController
  # index
  def home
    redirect_to(articles_path) if current_user
  end
end
