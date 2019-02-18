class PagesController < ApplicationController
  def home
  end

  def about
  end

  def help
    @unique_donation = UniqueDonation.new
  end

end
