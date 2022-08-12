class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.all

    if params[:game_genre_id]
      @reviews = []
      params[:game_genre_id].each do |key, value|
        @reviews += GameGenre.find_by(genre_name: key).reviews if value == "1"
      end
      @reviews.uniq!
    end
  end

  def new
    @review = Review.new
    @review_genre_intermediate = ReviewGenreIntermediate.new
    @game_genres = GameGenre.all

  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @game_genre_ids = params[:review_genre_intermediate][:game_genre_id]
    @game_genre_ids.shift
      @review.save
      @game_genre_ids.each do |genre|
        game_genre = GameGenre.find(genre.to_i)
        @review.game_genres << game_genre
      end
    redirect_to '/reviews/new'
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:customer_id, :game_title, :evaluation, :review_title, :review, game_genre_id:[])
  end
end
