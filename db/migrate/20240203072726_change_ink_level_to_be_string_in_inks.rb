class ChangeInkLevelToBeStringInInks < ActiveRecord::Migration[7.0]
  def change
    change_column :inks, :ink_level, :string
  end
end
