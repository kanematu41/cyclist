class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		@comment_post = @comment.post #コメントに紐づく投稿
		@comment_post.create_notification_comment!(current_user, @comment.id) #コメント通知
		render :index
	end

	def destroy
		@comment = Comment.find(params[:post_id])
		@comment.destroy
		render :index
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
