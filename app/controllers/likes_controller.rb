class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post: @post)

    if @like.save
      redirect_to @post 
    else
      redirect_to @post, alert: 'Unable to like post.'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post: @post)
    @like.destroy if @like

    redirect_to @post
  end
end
