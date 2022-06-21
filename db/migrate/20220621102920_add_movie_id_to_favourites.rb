class AddMovieIdToFavourites < ActiveRecord::Migration[6.0]
  def change
    add_column :favourites, :movie_id, :integer
  end
end
