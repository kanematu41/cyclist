class SearchsController < ApplicationController
	before_action :authenticate_user!

  def index
    @user_or_post = params[:option]
    if @user_or_post == "1"
      @users = User.search(params[:search], @user_or_post)
    else
      @posts = Post.search(params[:search], @user_or_post)
    end
  end

  def tag
    if params[:tag_name]
      @posts = Post.page(params[:page]).reverse_order.tagged_with("#{params[:tag_name]}")
    end
  end
end
