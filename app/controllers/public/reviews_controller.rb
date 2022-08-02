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
    
    @review_genre_intermediate = ReviewGenreIntermediate.new
    @review_genre_intermediate.review_id = @review.id
    @review_genre_intermediate.game_genre_id = game_genre.id
    review_genre_intermediate.save
    redirect_to 'reviews/index'
  end

  def show
  end

  def update
  end

  def destroy
  end
end
