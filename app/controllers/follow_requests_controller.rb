class FollowRequestsController < ApplicationController
  def create 
    @user = User.find(params[:user_id])
    @follow_request = current_user.follow_requests_as_follower.new(followee: @user)

    if @follow_request.save
      redirect_to users_path, notice: 'You are now following this user.'
    else
      redirect_to users_path, alert: 'Unable to follow user.'
    end
  end

  def destroy
    @follow_request = FollowRequest.find(params[:id])
    @user = @follow_request.followee
    @follow_request.destroy
    redirect_to users_path, notice: 'You have unfollowed this user.'
  end
end
