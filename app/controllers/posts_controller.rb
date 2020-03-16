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
    post = Post.create(post_params)
    if post.save
      redirect_to root_path, notice: '保存されました'
    else
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:comment, :image).merge(user_id: current_user.id)
  end
end
