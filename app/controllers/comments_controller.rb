class CommentsController < ApplicationController

	# # Build in User Authentication
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	### CONTROLLER ACTIONS(I,S,N,E,C,U,D)

	# # Creates a comment for an article 
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	# # Destroyes a specific Comment from an article
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	### UTILITIES

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
