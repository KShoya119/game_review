class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
    @review_genre_intermediate = ReviewGenreIntermediate.new

  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save
    redirect_to '/reviews/new'
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:customer_id, :game_title, :evaluation, :review_title, :review)
  end

  def review_genre_intermediate_params
    params.require(:review_genre_intermediate).permit(:game_genre_id, game_genre_ids:[])
  end
end
