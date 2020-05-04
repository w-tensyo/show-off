class PostsController < ApplicationController
before_action :set_post, only: [:show]

  
  def index
    @posts = Post.all.includes(:user).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @parents = Category.where(ancestry: nil)
  end

  def new
    @post = Post.new
    @post.gears.new
    @parent_category_array = []
    Category.where(ancestry: nil).each do |parent_category|
      @parent_category_array << parent_category
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: '保存されました'
    else
      redirect_to root_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_update_params)
    redirect_to root_path, notice: '修正が完了しました'
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: '投稿を削除しました'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:comment, :image, :category_id, :user_id, gears_attributes: [:equipment, :equ_comment, :_destroy, :id])
  end


  def post_update_params
    params.require(:post).permit(:comment, :image, gears_attributes: [:equipment,:equ_comment,:_destroy,:id])
  end
end
