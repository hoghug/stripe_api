class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def new
    @charity = Charity.new
  end

  def create
    @charity = Charity.new(charity_params)
    if @charity.save
      flash[:notice] = "Charity Saved"
      redirect_to charities_path
    else
      flash[:notice] = "Error, not saved"
      redirect_to :back
    end
  end

  def show
    @charity = Charity.find(params[:id])
    @donation = Donation.new
    @plan = Plan.new
    @plans = Plan.all
    @subscribers = current_user.subscribers.pluck(:plan_id)
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
    redirect_to charities_path
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update(charity_params)
      flash[:notice] = "Charity Updated"
      redirect_to charities_path
    else
      flash[:notice] = "Error, failed to update"
      redirect_to :back
    end
  end

private

  def charity_params
    params.require(:charity).permit(:name, :description)
  end

end
