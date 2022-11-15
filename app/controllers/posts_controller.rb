class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  wrap_parameters format: []
  
  def create
    post = Post.create!(post_params)
    render json: post, status: :accepted
  end


  private

  def post_params
    params.permit(:title, :content, :summary, :category)
  end

  def render_unprocessable_entity(invalid)
    render json: {error: invalid.record.errors}, status: :unprocessable_entity
  end
end
