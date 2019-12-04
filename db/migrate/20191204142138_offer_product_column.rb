class OfferProductColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :offer, :integer, default: 0
  end
end
