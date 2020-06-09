class SearchsController < ApplicationController
	before_action :authenticate_user!

  def index
    @user_or_post = params[:option]
    if @user_or_post == "1"
      @users = User.page(params[:page]).per(15).search(params[:search], @user_or_post)
    elsif @user_or_post == "2"
      @posts = Post.page(params[:page]).reverse_order.per(8).search(params[:search], @user_or_post)
    else
      @posts = Post.page(params[:page]).reverse_order
    end
  end

  def tag
    @tag_name = params[:tag_name]
    @posts = Post.page(params[:page]).reverse_order.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end
end
