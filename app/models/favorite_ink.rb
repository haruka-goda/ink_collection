class FavoriteInk < ApplicationRecord
  belongs_to :user
  belongs_to :ink

  validates :user_id, uniqueness: { scope: :ink_id }
end
