class Favourite < ApplicationRecord
    include Filterable
    belongs_to :user
    belongs_to :movie
    validates :title, presence: true
    validates :imdbID, presence: true
    validates :year, presence: true
    validates :remainder_date, presence: true
    validates :user_id, presence: true
    validates :movie_id, presence: true
end
