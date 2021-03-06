class OrdersController < ApplicationController
  def create
    request = Request.find(params[:request_id])
    order  = Order.create!(request_sku: request.sku, amount: request.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

end
