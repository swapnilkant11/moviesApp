class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movies, only: [:show_movies, :remove_movie]
  include CustomeResponse

  def home
    page = params[:page] || 1
    limit = params[:limit] || 5
    @movies = Movie.filter(params.slice(:title, :year, :length_type)).page(page).per(limit)
    success_response(@movies)
  end

  def show_movies
    success_response(@movies)
  end

  def remove_movie
    @movie = Movie.find(params[:id])
    @movie.destroy
    render json: "Data deleted successfully!!"
  end

  def set_movies
    begin
      @movies = Movie.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      return render json: { message: e.message }, status: :not_found
    end
  end
end
