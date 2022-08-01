class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
    @game_genres = GameGenre.all
  end

  def create
    @review = Review.new(review_params)
    @book.customer_id = current_customer.id
    review.save
    redirect_to 'reviews/index'
  end

  def show
  end

  def update
  end

  def destroy
  end
end
