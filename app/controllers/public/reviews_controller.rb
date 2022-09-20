class Public::ReviewsController < ApplicationController
  before_action :move_to_signed_in,except: [:index]

  def index
    @reviews = params[:tag_id].present? ? GameGenre.find(params[:tag_id]).reviews.published.order(id: "DESC").page(params[:page]) : Review.published.order(id: "DESC").page(params[:page])

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
      if @review.save
        @game_genre_ids.each do |genre|
          game_genre = GameGenre.find(genre.to_i)
          if @review.game_genres << game_genre
          else
            render :new
          end
        end
        redirect_to '/reviews'
      else
        render :new
      end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to customer_path
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to customer_path(current_customer)
  end

  private
  def review_params
    params.require(:review).permit(:customer_id, :game_title, :evaluation, :review_title, :review, :status, game_genre_id:[])
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to  '/customers/sign_in', notice: '利用するには会員登録、またはログインが必要です'
    end
  end
end
