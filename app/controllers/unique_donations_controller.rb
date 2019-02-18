class UniqueDonationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @unique_donation = UniqueDonation.find(params[:id])
  end
  def new
    @unique_donation = UniqueDonation.new
  end

  def create
    @unique_donation = UniqueDonation.new(unique_donation_params)
    if @unique_donation.save
      redirect_to unique_donation_path(@unique_donation)
    else
      render "new"
    end
  end

  private

  def unique_donation_params
    params.require(:unique_donation).permit(:amount, :user_id)
  end
end
