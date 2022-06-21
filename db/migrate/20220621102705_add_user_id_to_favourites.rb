class AddUserIdToFavourites < ActiveRecord::Migration[6.0]
  def change
    add_column :favourites, :user_id, :integer
  end
end
