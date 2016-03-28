class Api::PostsController < ApplicationController

  # protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  before_action do
    if @current_user.nil?
      # redirect_to sign_in_path

      render json: {authenticated: false}, status: 401
    end
  end

  def index
    @posts = Post.order("created_at desc")
  end

  def create

    @post = Post.new params.require(:post).permit(:text)
    @post.user = @current_user
    if @post.save
      render :show
    else
      render json: {errors: @post.errors}, status: 422
    end
  end
end
