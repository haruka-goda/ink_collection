class AddInkIdToPens < ActiveRecord::Migration[7.0]
  def change
    add_column :pens, :ink_id, :integer, null: true
    add_index :pens, :ink_id
    add_foreign_key :pens, :inks, column: :ink_id
  end
end
