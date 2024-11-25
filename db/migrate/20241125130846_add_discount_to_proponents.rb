class AddDiscountToProponents < ActiveRecord::Migration[7.2]
  def change
    add_column :proponents, :discount, :decimal, precision: 11, scale: 2
  end
end
