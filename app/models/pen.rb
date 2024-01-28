class Pen < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :brand, presence: true
  validates :description, length: { maximum: 140 }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name brand]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[name brand]
  end
end
