class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def index
    current_user
    @articles = @current_user.articles.all
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

  def set_details
    BookmarksController.get_details(data)
  end

  private
  def article_params
    params.require(:article).permit(:name,:description)
  end

end
