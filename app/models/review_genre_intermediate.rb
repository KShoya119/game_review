class ReviewGenreIntermediate < ApplicationRecord
  belongs_to :review
  belongs_to :game_genre
end
