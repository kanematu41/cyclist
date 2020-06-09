class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: %i[edit timeline]

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.page(params[:page]).reverse_order.per(8)
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
    @users = @user.following_user.page(params[:page]).per(15)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user.page(params[:page]).per(15)
  end

  def timeline
    @user = User.find(params[:id])
    @posts = Post.page(params[:page]).reverse_order.where(user_id: @user.following_user)
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :image)
  end

  def baria_user
    @user = User.find(params[:id])
    redirect_to root_path if @user != current_user
  end
end
