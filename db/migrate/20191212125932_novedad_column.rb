class NovedadColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :novedad, :integer, null: false, default: 0
  end
end
