class Favourite < ApplicationRecord
    include Filterable
    belongs_to :user
    belongs_to :movie
end
