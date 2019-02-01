class ArticlesController < ApplicationController
  #before_action :find_article, only: [:show, :edit, :update, :destroy]

  def new
    #@article = Article.new
    @article = current_user.articles.build
  end

  def index
    @articles = current_user.articles.all
  end

  def create
    @user = User.find(session[:user_id])
    @article = @user.articles.new(article_params)
    if @article.save
      redirect_to "/articles"
    else
      redirect_to  controller: "home" , action: "index"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.delete
      flash[:notice] = 'Article deleted!'
      redirect_to articles_path
    else
      flash[:error] = 'Failed to delete this article!'
      render :destroy
    end
  end

  def bookmark
    type = params[:type]
    @article = Article.find(params[:id])
    if type == "bookmark"
      current_user.bookmarked_articles << @article
      if current_user.save
        redirect_to "/articles"
      end
    elsif type == "unbookmark"
      current_user.bookmarked_articles.delete(@article)
      redirect_to "/articles"
    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  private
  def article_params
    params.require(:article).permit(:name,:description)
  end
  def find_article
    @article = Article.find(params[:id])
  end

end
