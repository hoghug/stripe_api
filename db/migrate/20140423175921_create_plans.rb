class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.belongs_to :charity
      t.string :name
      t.float :amount
      t.string :interval
      t.string :slug

    end
  end
end
