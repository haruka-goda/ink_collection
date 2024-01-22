class CreateInks < ActiveRecord::Migration[7.0]
  def change
    create_table :inks do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.string :color
      t.integer :ink_level
      t.date :purchase_date
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
