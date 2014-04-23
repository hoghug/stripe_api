class SubscribersController < ApplicationController

  def create
    @plan = Plan.find(params[:plan_id])
    @user = User.find(params[:user_id])

    @subscriber = @plan.subscribers.new(user_id: @user.id)

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

end
