class FavoriteInk < ApplicationRecord
  belongs_to :user
  belongs_to :ink
end
