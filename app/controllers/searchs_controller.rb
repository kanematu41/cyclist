class SearchsController < ApplicationController
  def index
    @user_or_post = params[:option]
    if @user_or_post == "1"
      @users = User.search(params[:search], @user_or_post)
    else
      @posts = Post.search(params[:search], @user_or_post)
    end
  end
end
