class CreateFavoriteInks < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_inks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ink, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favorite_inks, %i[user_id ink_id], unique: true
  end
end
