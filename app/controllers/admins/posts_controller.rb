class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!

  def list
  	user = User.find(params[:id])
  	@posts = Post.page(params[:page]).reverse_order.where(user_id: user.id)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to admins_users_path,notice: "削除されました"
  end
end
