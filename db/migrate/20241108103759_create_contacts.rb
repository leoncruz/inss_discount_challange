class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.boolean :reference, default: false
      t.string :telephone, null: false
      t.references :proponent, null: false, foreign_key: { index: true }

      t.timestamps
    end
  end
end
