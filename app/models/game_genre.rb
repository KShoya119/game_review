class GameGenre < ApplicationRecord
 has_many :review_genre_intermediate
 has_many :reviews,through: :review_genre_intermediates
end
