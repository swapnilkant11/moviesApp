class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.string :title
      t.string :year
      t.string :imdbID
      t.string :poster
      t.datetime :remainder_date

      t.timestamps
    end
  end
end
