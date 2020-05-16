class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  	  redirect_to post_path(@post), notice: "投稿されました"
    else
      render :new
    end
  end

  def index
  	@posts = Post.page(params[:page]).reverse_order
    # @posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id)) #いいねランキング
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  	  redirect_to post_path(@post), notice: "編集されました"
    else
      render :edit
    end
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:title, :body, :tag_list, {image: []})
  end
end
