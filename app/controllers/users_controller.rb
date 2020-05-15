class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		redirect_to user_path(@user), notice: "編集されました"
  	else
  		render :edit
  	end
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.following_user
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user
  end

  def timeline
    @user = User.find(params[:id])
    @posts = Post.page(params[:page]).reverse_order.where(user_id: @user.following_user)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :image)
  end
end
