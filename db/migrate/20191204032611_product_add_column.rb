class ProductAddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :genero, :integer
  end
end
