class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favourites, only: [:show_favourites, :remove_favourites]
  include FavouriteResponse
  include CustomeResponse
  def home
    page = params[:page] || 1
    limit = params[:limit] || 5
    @favourites = Favourite.filter(params.slice(:user_id, :movie_id, :title)).page(page).per(limit)
    success_response(@favourites)
  end

  def show_favourites
    success_response(@favourites)
  end

  def create_favourite
    @movie_id = Movie.find(params[:id])
    @title = @movie_id.title
    @year = @movie_id.year
    @imdbID = @movie_id.imdbID
    @poster = @movie_id.poster
    @favourite = Favourite.create(user_id: current_user.id, movie_id: params[:id], title: @title, year: @year, imdbID: @imdbID, poster: @poster, remainder_date: params[:remainder_date])
    favourite_response(@favourite)
  end

  def remove_favourites
    @favourites = Favourite.find(params[:id])
    @favourites.destroy
    remove_favourite_response
  end

  def set_favourites
    begin
      @favourites = Favourite.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      return render json: { message: e.message }, status: :not_found
    end
  end

  def favourite_params
    params.permit(:user_id, :movie_id, :title, :year, :imdbID, :poster, :remainder_date)
  end
end
