class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
     @author = @post.author
     #here we have to render author instance to have it show up in our partial _author for the post views
  end

  def new
    @post = Post.new
  end

  def create
    @author = Author.first
    @post = Post.new
    @post.title = params[:title]
    @post.description = params[:description]
    @post.author_id = @author.id #here every post created is linked to the author
    @post.save
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(title: params[:title], description: params[:description])
    redirect_to post_path(@post)
  end

end
