class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
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
