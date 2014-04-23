class Donation < ActiveRecord::Base
  belongs_to :charity

  before_create :stripe_transfer

  # Set your secret key: remember to change this to your live secret key in production
# See your keys here https://manage.stripe.com/account

  def stripe_transfer
    Stripe.api_key = "sk_test_bceBiIJnWmhSU4bpJa5z4vcP"

    token = self.stripe_token

    begin
      charge = Stripe::Charge.create(
        :amount => (self.amount*100).to_i, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
    rescue Stripe::CardError => e
    end
  end


end
