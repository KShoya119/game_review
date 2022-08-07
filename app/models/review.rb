class Review < ApplicationRecord
  has_many :review_genre_intermediates
  has_many :game_genres,through: :review_genre_intermediates
  belongs_to :customer

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
