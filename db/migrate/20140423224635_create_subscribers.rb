class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.belongs_to :user
      t.belongs_to :plan
    end
  end
end
