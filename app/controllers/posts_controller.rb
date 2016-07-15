class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    # render json: @posts
    # render :index
  end

  def new
    @post = Post.new
  end

  def create
    puts post_params
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render json: @post.errors.messages
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
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :tag, :body)
  end
end
