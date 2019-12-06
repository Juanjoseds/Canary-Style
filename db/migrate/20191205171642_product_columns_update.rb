class ProductColumnsUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :talla_chandal, :string
  end
end
