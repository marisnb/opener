class BookmarksController < ApplicationController
  def index
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      puts "-------------------------"
    end
  end

  def self.get_details(data)
    puts "--get_details--   #{data}"
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(@current_user,@article)
    end
end
