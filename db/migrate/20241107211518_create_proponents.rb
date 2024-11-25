class CreateProponents < ActiveRecord::Migration[7.2]
  def change
    create_table :proponents do |t|
      t.string "name", null: false
      t.string "cpf", null: false
      t.date "birth_date", null: false
      t.decimal "salary", precision: 10, scale: 2, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
