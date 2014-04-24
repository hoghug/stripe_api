class SubscribersController < ApplicationController

  def create
    @plan = Plan.find(params[:plan_id])
    @user = User.find(params[:user_id])
    breaker
    @subscriber = @plan.subscribers.new(user_id: @user.id, stripe_token: subscriber_params[:stripe_token])

    if @subscriber.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    redirect_to :back
  end


private

  def subscriber_params
    params.require(:subscriber).permit(:stripe_token)
  end

end
