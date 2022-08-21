class Admin::ReviewsController < ApplicationController
  def index
    @reviews = params[:tag_id].present? ? GameGenre.find(params[:tag_id]).reviews : Review.all
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to admin_reviews_path
  end

  def show
     @review = Review.find(params[:id])
  end
end
