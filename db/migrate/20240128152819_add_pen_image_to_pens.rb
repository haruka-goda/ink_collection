class AddPenImageToPens < ActiveRecord::Migration[7.0]
  def change
    add_column :pens, :pen_image, :string
  end
end
