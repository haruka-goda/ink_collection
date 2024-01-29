class AddInkImageToInks < ActiveRecord::Migration[7.0]
  def change
    add_column :inks, :ink_image, :string
  end
end
