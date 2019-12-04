class ProductColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image, :string
    add_column :products, :rgb, :string
    add_column :products, :talla, :text, array: true, default: []
  end
end
