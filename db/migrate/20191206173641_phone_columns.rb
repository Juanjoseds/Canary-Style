class PhoneColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string, null: false, default: 0
  end
end
