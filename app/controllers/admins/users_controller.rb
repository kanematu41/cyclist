class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@users = User.with_deleted.page(params[:page]).per(15)
  end

  def show
  	@user = User.find(params[:id])
    @post_data = @user.posts.group("date(created_at)").count
    @like_data = @user.likes.group("date(created_at)").count
    @comment_data = @user.comments.group("date(created_at)").count
  end

  def update
  	user = User.only_deleted.find(params[:id])
  	user.restore
  	redirect_to admins_users_path, notice: "元に戻しました。"
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to admins_users_path, notice: "無効にしました。"
  end
end
