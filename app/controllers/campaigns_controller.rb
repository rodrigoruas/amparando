class CampaignsController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @donations = @campaign.donations.where("state = '3'")
    @donation_total = @donations.inject(0){|sum,e| sum + e.amount }
    @donation_percentage = ((@donation_total.to_f/@campaign.price.to_f) * 100).round(0)
    @donation = Donation.new
  end
end
