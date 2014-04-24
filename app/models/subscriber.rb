class Subscriber < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  before_create :add_suscriber

  def add_subscriber
    Stripe.api_key = 'sk_test_bceBiIJnWmhSU4bpJa5z4vcP'

    token = self.stripe_token

    customer = Stripe::Customer.create(
      :card => token,
      :plan => Plan.find(self.plan_id).slug,
      :email => User.find(self.user_id).email
    )
  end


end
