class Public::CustomersController < ApplicationController
  def show
  end

  def favorites
    @customer = Customer.find(params[:id])
    fovorites= Fovorite.where(customer_id: @customer.id).pluck(:review_id)
    @fovorite_reviews = Review.find(fovorites)
  end

  def withdrawal
  end
end
