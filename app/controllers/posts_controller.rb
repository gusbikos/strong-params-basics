class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  #@post = Post.new(params.require(:post).permit(:title, :description)) - strong params long way with identifying
	  #each key
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  #@post.update(params.require(:post).permit(:title)) - long way 
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private 

	def post_params # - this private method is required when you use strong params 
		params.require(:post).permit(:title, :description)
	end
end
