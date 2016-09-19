class PostsController < ApplicationController
	def index
		@article = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		@category = Category.all
	end

	def create
		@article = Article.new(params[:post])
		if @article.save
			redirect_to articles_path, :notice => "Your post has been saved"
		else
			render "new"
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@post = Article.find(params[:id])

		if @post.update_attributes(params[:post])
			redirect_to article_path, :notice => "Your post has been updated"
		else
			render "edit"
		end
	end

	def destroy
		@article= Article.find(params[:id])
		@article.destroy
		redirect_to article_path, :notice => "Your post has been deleted"
	end

end

