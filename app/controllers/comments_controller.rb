class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params.merge(post: @post))

    if @comment.save
      redirect_to @post
    else 
      redirect_to @post, alert: 'Unable to comment post.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
