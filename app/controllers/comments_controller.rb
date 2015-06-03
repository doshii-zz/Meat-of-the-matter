class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params.require(:comment).permit!)
    @comment.author = current_user.email
    redirect_to @post
  end
end
