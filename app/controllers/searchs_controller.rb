class SearchsController < ApplicationController
	before_action :authenticate_user!

  def index
    @user_or_post = params[:option]
    if @user_or_post == "1"
      @users = User.search(params[:search], @user_or_post)
    elsif @user_or_post == "2"
      @posts = Post.page(params[:page]).reverse_order.search(params[:search], @user_or_post)
    else
      @posts = Post.page(params[:page]).reverse_order
    end
  end

  def tag
    if params[:tag_name]
      @tag_name = params[:tag_name]
      @posts = Post.page(params[:page]).reverse_order.tagged_with("#{params[:tag_name]}")
    end
  end
end
