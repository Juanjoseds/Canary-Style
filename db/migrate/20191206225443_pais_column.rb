class PaisColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pais, :string, null: false, default: 0
  end
end
