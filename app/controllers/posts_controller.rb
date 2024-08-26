class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    followed_user_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: [current_user.id] + followed_user_ids).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = current_user.posts.build
  end

  def create 
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private 

  def post_params
    params.require(:post).permit(:body)
  end
end
