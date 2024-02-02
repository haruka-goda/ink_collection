class CreateFavoritePens < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_pens do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pen, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favorite_pens, [:user_id, :pen_id], unique: true
  end
end
