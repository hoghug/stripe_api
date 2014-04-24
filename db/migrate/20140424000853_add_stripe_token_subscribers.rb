class AddStripeTokenSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :stripe_token, :string
  end
end
