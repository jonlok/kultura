class CommentsController < ApplicationController
  before_action :authenticate_user!

   def new
    @comment = current_user.comments.new(post_id: params[:post_id])
   end

   def index
   end

   def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to posts_path

      # render json: { message: "201 Created" }, status: :created
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end


end
