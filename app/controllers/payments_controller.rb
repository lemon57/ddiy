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
    amount:       @job.amount_cents,
    description:  "Payment for request #{@job.request_sku} for job #{@job.id}",
    currency:     @job.amount.currency
  )

  @job.update(payment: charge.to_json, state: 'paid')
  redirect_to job_path(@job)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_job_payment_path(@job)
end

private

  def set_job
    @job = Job.find(params[:job_id])
  end
end
