class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render json: { data: @movies, status: { code: 200, message: "done" } }, status: status
  end
end
