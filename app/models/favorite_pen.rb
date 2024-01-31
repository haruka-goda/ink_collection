class FavoritePen < ApplicationRecord
  belongs_to :user
  belongs_to :pen

  validates :user_id, uniqueness: { scope: :pen_id }
end
