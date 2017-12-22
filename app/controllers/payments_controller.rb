class PaymentsController < ApplicationController
    before_action :set_job

  def new
  end

  def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @job.price_cents,
    description:  "Payment for request for job #{@job.id}",
    currency:     "EUR"
  )

  flash[:notice] = "Your payment was accepted"
  redirect_to dashboard_owners_path

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_job_payment_path(@job)
end

private

  def set_job
    @job = Job.find(params[:job_id])
  end
end
