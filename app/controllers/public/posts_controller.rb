class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.genre_id = post_params[:genre_id]
    @post.tag_id = post_params[:tag_id]
    # puts @post.inspect
    # puts post_params
    @post.save!
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:question_id, :genre_id, :tag_id, :title, :introduction, :link, :status, :name)
  end
end
