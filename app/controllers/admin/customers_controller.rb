class Admin::CustomersController < ApplicationController
  before_action :move_to_signed_in

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.order(id: "DESC").page(params[:page])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :encrypted_password, :is_valid)
  end

  def move_to_signed_in
    unless admin_signed_in?
      redirect_to  '/admins/sign_in'
    end
  end
end
