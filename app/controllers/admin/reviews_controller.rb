class Admin::ReviewsController < ApplicationController
  before_action :move_to_signed_in

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

  private
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admins/sign_in'
    end
  end
end
