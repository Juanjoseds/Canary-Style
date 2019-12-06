class ProductTypeColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :type, :integer, default: 0
  end
end
