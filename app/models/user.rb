class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :pens, dependent: :destroy
	has_many :inks, dependent: :destroy
  has_many :favorite_pens, dependent: :destroy
  has_many :favorited_pens, through: :favorite_pens, source: :pen
  has_many :favorite_inks, dependent: :destroy
  has_many :favorited_inks, through: :favorite_inks, source: :ink

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 20 }

  def own?(object)
    id == object.user_id
  end

  def favorite_pen(pen)
    favorited_pens << pen
  end

  def unfavorite_pen(pen)
    favorited_pens.destroy(pen)
  end

  def favorite_pen?(pen)
    favorited_pens.include?(pen)
  end
  
  def favorite_ink(ink)
    favorited_inks << ink
  end

  def unfavorite_ink(ink)
    favorited_inks.destroy(ink)
  end

  def favorite_ink?(ink)
    favorited_inks.include?(ink)
  end
end
