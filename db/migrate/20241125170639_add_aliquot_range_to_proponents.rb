class AddAliquotRangeToProponents < ActiveRecord::Migration[7.2]
  def change
    add_column :proponents, :aliquot_range, :integer, null: false, default: 1
  end
end
