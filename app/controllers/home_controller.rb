class HomeController < ApplicationController
  def index
    @articles = Article.without_user(current_user)
    @user = current_user
  end

  def show
    @articles = Article.without_user(current_user)
  end
end
