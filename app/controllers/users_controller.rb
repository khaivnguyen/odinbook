class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile photo updated successfully.'
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_photo)
  end
end
