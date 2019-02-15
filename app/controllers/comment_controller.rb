class CommentController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:id])
    tag = params[:tag]
    puts "-----------#{params[:tag]}"
    if tag == "Comment"
      @comment = Comment.new(comment_params.merge(article: @article, user:current_user,tag: :Comment))
    else
      @comment = Comment.new(article: @article, user:current_user,tag: :Like)
    end
    if @comment.save
      redirect_to "/articles/#{params[:id]}"
    else
      redirect_to  controller: "sessions" , action: "index"
    end
  end

  private
   def comment_params
     params.require(:comment).permit(:content)
   end
  # def like_params
  #   params.require(:comment)
  # end
end
