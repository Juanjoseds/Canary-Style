class AdminUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :integer
  end
end
