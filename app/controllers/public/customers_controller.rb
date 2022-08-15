class Public::CustomersController < ApplicationController
  def show
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites= Favorite.where(customer_id: @customer.id).pluck(:review_id)
    @favorite_reviews = Review.find(favorites)
  end

  def withdrawal
  end
end
