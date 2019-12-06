class UserTalla < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :talla_pie, :integer
    add_column :users, :talla_camiseta, :string
    add_column :users, :talla_pantalon, :integer
  end
end
