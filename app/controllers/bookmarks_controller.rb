class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @article = Article.find(params[:articles_id])
    @user = User.new
    @user.bookmarked_articles << @article
    if current_user.save
      redirect_to "/articles"
    end
  end

  def self.get_details(data)
    puts "--get_details--   #{data}"
  end

  private
    # def bookmark_params
    #   params.require(:bookmark).permit()
    #   puts params
    # end
end
