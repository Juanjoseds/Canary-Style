class UserNewColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :direccion, :string, null: false, default: 0
    add_column :users, :ciudad, :string, null: false, default: 0
  end
end
