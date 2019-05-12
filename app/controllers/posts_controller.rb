class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.all()
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
      @post = Post.find(params[:id])
      if @post.user != current_user
        redirect_to(posts_path)
      else
    end

  end

  def create
    @post = Post.create(post_params)
    @post.update(user_id:current_user.id)
    redirect_to(post_path(@post))
  end

  def update
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to(posts_path)
    end
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  def destroy
      @post = Post.find(params[:id])
      if @post.user != current_user
        redirect_to(posts_path)
      else
      @post.destroy
    end
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
