class Movie < ApplicationRecord
    validates :title, presence: true
    validates :imdbID, presence: true
    validates :length_type, presence: true
    validates :poster, presence: true
end
