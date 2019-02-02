class PagesController < ApplicationController
  before_action :authenticate_user!, only: :confirmed
  def home
  end

  def about
  end

  def confirmed
    if params.has_key?(:transaction_id)
      @donation = Donation.where("user_id = #{current_user.id}").last
      @donation.paid = true
      transaction_id = (params[:transaction_id])
      @donation.transaction_id = transaction_id
      @donation.save
    end
  end
end
