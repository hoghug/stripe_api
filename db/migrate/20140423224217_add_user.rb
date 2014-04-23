class AddUser < ActiveRecord::Migration
  def change
    add_belongs_to :donations, :user
  end
end
