class ArticlesController < ApplicationController

	### CONTROLLER ACTIONS(I,S,N,E,C,U,D)

	# # Displays a list of all articles
	def index
		@articles = Article.all
	end

	# # Displays an article
	def show
		@article = Article.find(params[:id])
	end

	# # Sends page with the form for a new article
	def new
		@article = Article.new
	end

	# # Opens an article for editing
	def edit
		@article = Article.find(params[:id])
	end

	# # Create the new article
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	# # Updates an article in the database after editing
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	# # Removes article from database
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	### UTILITIES
	private

		# # Recieves the parameters of the request
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
