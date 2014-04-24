class ChangePlansAmount < ActiveRecord::Migration
  def change
    change_column :plans, :amount, :integer
  end
end
