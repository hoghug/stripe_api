class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @donation = Donation.new
  end

  def create
    @charity = Charity.find(params[:charity_id])
    @donation = @charity.donations.new(donation_params)
    if @donation.save
      flash[:notice] = "Donation Made"
      redirect_to charities_path
    else
      flash[:notice] = "Error, failed to process"
      redirect_to :back
    end
  end

private

  def donation_params
    params.require(:donation).permit(:user_id, :amount, :stripe_token)
  end

end
