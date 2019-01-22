class Admin::CampaignsController < ApplicationController
  before_action :authenticate_user!, :check_admin!
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      redirect_to admin_campaigns_path
    else
      render "new"
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_to admin_campaigns_path
    else
      render "edit"
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title, :description, :photo, :price)
  end

  def check_admin!
    current_user.admin
  end
end
