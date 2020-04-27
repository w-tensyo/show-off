class PostsController < ApplicationController
before_action :set_post, only: [:show]


  # class PostForm
  #   include ActiveModel::Model #テーブルは持たないが、ApplicationRecordのsaveメソッドなどを提供
  
  #   attr_accessor :comment, :image, :equipment, :equ_comment, :post_id, :user_id
  
  #   validates :image, presence: true
  
  #   def save
  #     return false if invalid? #バリデーションを追加する場合はここに追加
  
  #     #postインスタンスを作成。Postsテーブルの各種カラムを引数で指定してあげる。この段階で各種パラメータはnilとなっていると思う
  #     post = Post.new(comment: comment,image: image, user_id: user_id)
  #     post.gears.new(equipment: equipment,equ_comment: equ_comment, post_id: post_id)
  #     post.save
  #   end
  # end

  
  def index
    @posts = Post.all.includes(:user).order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def new
    # @post_form = PostForm.new
    @post = Post.new
    @post.gears.new
  end

  def create
    # @post_form = PostForm.new(post_params)
    # if @post_form.save
    #   redirect_to root_path, notice: '保存されました'
    # else
    #   redirect_to root_path
    # end
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
    params.require(:post).permit(:comment,:image, :user_id, gears_attributes: [:equipment, :equ_comment, :_destroy, :id])
  end

  # def post_params
  #   params.require(:posts_controller_post_form).permit(:comment, :image, :equipment, :equ_comment, :post_id).merge(user_id: current_user.id)
  # end

  def post_update_params
    params.require(:post).permit(:comment, :image, gears_attributes: [:equipment,:equ_comment,:_destroy,:id])
  end
end
