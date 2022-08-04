class Review < ApplicationRecord
  has_many :review_genre_intermediates
  has_many :game_genres

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
