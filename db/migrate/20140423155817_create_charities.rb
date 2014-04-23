class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :description
    end

    create_table :donations do |t|
      t.belongs_to :charity
      t.float :amount

      t.timestamps
    end

  end
end
