class DonationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @donation = Donation.new
  end

  def show
    @donation = Donation.find(params[:id])
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @donation = Donation.new(donation_params)
    if @donation.save
      redirect_to campaign_donation_path(@campaign, @donation)
    else
      render "new"
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :campaign_id, :user_id)
  end
end
