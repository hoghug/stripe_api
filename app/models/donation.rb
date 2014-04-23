class Donation < ActiveRecord::Base
  belongs_to :charity
  belongs_to :user

  before_create :stripe_donation

  def stripe_donation
    Stripe.api_key = 'sk_test_bceBiIJnWmhSU4bpJa5z4vcP'

    token = self.stripe_token

    begin
      charge = Stripe::Charge.create(
        :amount => self.amount * 100, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
    rescue Stripe::CardError => e
    end
  end


end
