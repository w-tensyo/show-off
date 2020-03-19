class PostsController < ApplicationController

  class PostForm
    include ActiveModel::Model #テーブルは持たないが、ApplicationRecordのsaveメソッドなどを提供
  
    attr_accessor :comment, :image, :equipment, :equ_comment, :post_id, :user_id
  
    validates :image, presence: true
  
    def save
      return false if invalid? #バリデーションを追加する場合はここに追加
  
      #postインスタンスを作成。Postsテーブルの各種カラムを引数で指定してあげる。この段階で各種パラメータはnilとなっていると思う
      post = Post.new(comment: comment,image: image, user_id: user_id)
      post.gears.new(equipment: equipment,equ_comment: equ_comment, post_id: post_id)
      post.save
    end
  end

  
  def index
    @posts = Post.all.includes(:user).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def new
    @post_form = PostForm.new
  end

  def create
    @post_form = PostForm.new(post_params)
    if @post_form.save
      redirect_to root_path, notice: '保存されました'
    else
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:posts_controller_post_form).permit(:comment, :image, :equipment, :equ_comment, :post_id).merge(user_id: current_user.id)
  end
end
