class Review < ApplicationRecord
  has_many :review_genre_intermediates, dependent: :destroy
  has_many :game_genres, through: :review_genre_intermediates
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  scope :published, -> {where(status: true)}
  scope :unpublished, -> {where(status: false)}

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
