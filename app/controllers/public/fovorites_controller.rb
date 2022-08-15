class Public::FovoritesController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    fovorite = current_customer.fovorites.new(review_id: review.id)
    fovorite.save
    redirect_to request.referer
  end

  def destroy
    review = Review.find(params[:review_id])
    fovorite = current_customer.fovorites.find_by(review_id: review.id)
    fovorite.destroy
    redirect_to request.referer
  end
end
