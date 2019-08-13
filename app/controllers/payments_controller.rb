class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @unique_donation = UniqueDonation.find(params[:unique_donation_id])
  end

  def create
  @unique_donation = UniqueDonation.find(params[:unique_donation_id])
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )
  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @unique_donation.amount_cents,
    description:  "Doação Amparando JG",
    currency:     @unique_donation.amount.currency
  )

  @unique_donation.update(payment: charge.to_json, state: 'paid')
  redirect_to unique_donation_path(@unique_donation)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to redirect_to order_path(@unique_donation)
  end
end
