class Public::CustomersController < ApplicationController
  before_action :move_to_signed_in
  
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites= Favorite.where(customer_id: @customer.id).pluck(:review_id)
    @favorite_reviews = Review.find(favorites)
  end

  def withdrawal
  end
  
  private
  def move_to_signed_in
    unless customer_signed_in?
      redirect_to  '/customers/sign_in'
    end
  end
end
