class Admin::CustomersController < ApplicationController
  before_action :move_to_signed_in

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.page(params[:page])
  end

  private
  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admins/sign_in'
    end
  end
end
