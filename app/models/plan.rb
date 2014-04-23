class Plan < ActiveRecord::Base
  belongs_to :charity

  before_create :stripe_plan_maker
  after_save :slugger

  def stripe_plan_maker
    Stripe.api_key = 'sk_test_bceBiIJnWmhSU4bpJa5z4vcP'
    Stripe::Plan.create(
      :amount => self.amount * 100,
      :interval => self.interval,
      :name => self.name,
      :currency => 'usd',
      :id => self.name.parameterize
    )

  end

  private

    def slugger
      self.slug = self.name.parameterize
      self.update_column(:slug, self.slug)
    end

end
