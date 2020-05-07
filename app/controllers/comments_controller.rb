class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@comment = Comment.find(params[:post_id])
		@comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
