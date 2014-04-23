class PlansController < ApplicationController
  def create
    @charity = Charity.find(params[:charity_id])
    @plan = @charity.plans.new(plan_params)

    if @plan.save
      flash[:notice] = 'Plan has been added'
      redirect_to :back
    else
      flash[:notice] = 'Error, plan not saved'
      redirect_to :back
    end

  end

  private
    def plan_params
      params.require(:plan).permit(:name, :amount, :interval)
    end

end
