class ChangeDonations < ActiveRecord::Migration
  def change
    change_column :donations, :amount, :integer
  end
end
