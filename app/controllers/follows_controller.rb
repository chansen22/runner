class FollowsController < ApplicationController

  def create
    @followee = User.find(params[:user_id])
    @follow = current_user.follows.create()
    @follow.followee_id = @followee.id

    respond_to do |format|
      if @follow.save
        format.html {redirect_to user_path(@followee), notice: 'User followed!' }
      else
        format.html {redirect_to user_path(@followee), notice: 'User not followed!' }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = Follow.where("followee_id = ? AND user_id = ?", params[:user_id], current_user.id)
    @follow.destroy_all
    redirect_to @user, notice: "User unfollowed!"
  end

end
