class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  wrap_parameters format: []
  
  def create
    author = Author.create!(author_params)
    render json: author, status: :accepted
  end


  private

  def author_params
    params.permit(:name, :phone_number)
  end

  def render_unprocessable_entity(invalid)
    render json: {error: invalid.record.errors}, status: :unprocessable_entity
  end

end
