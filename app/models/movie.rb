class Movie < ApplicationRecord
    include Filterable
    scope :filter_by_title, -> (val) {where(title: val)}
    scope :filter_by_year, -> (val) {where(year: val)}
    scope :filter_by_length_type, -> (val) {where(length_type: val)}
    validates :title, presence: true
    validates :imdbID, presence: true
    validates :length_type, presence: true
    validates :poster, presence: true
    has_many :favourites_user, class_name: 'Favourite', foreign_key: 'movie_id'
end
