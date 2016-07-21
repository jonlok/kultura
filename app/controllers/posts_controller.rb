class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.includes(:comments)
    @alluserposts = Post.all
    if params[:search]
      @alluserposts = Post.all.search(params[:search]).order("created_at DESC")
    else
      @alluserposts = Post.all.order('created_at DESC')
    end
    # render json: @posts
    # render :index
  end

  def new
    @post = current_user.posts.new
  end

  def create
    puts post_params
    # @post = Post.new(post_params)
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end

  end

  def edit
  end

  def update
    if @post.nil?
      render json: {
        message: "Cannot find post", delete: false }

    else
       @post.update(post_params)
       redirect_to posts_path
    end
  end

  def show
    # render 'show.jbuilder'
    render 'show.html.erb'
  end

  def destroy
    if @post.nil?

      render json: { message: "cannot find post", delete: false}
    else
      if @post.destroy
        redirect_to posts_path
      else
        render json: { message: "Unsuccessful", delete: false}
      end
    end
  end

  private

  def set_post
    @post = current_user.posts.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :tag, :body, :user_id, :timestamp, :image)
  end
end
