class FavoritePen < ApplicationRecord
  belongs_to :user
  belongs_to :pen
end
