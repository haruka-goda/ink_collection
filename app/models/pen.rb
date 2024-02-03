class Pen < ApplicationRecord
  mount_uploader :pen_image, PenImageUploader
  belongs_to :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :brand, presence: true
  validates :description, length: { maximum: 140 }, allow_blank: true

  BRANDS = {
    '国内ブランド' => ['その他(国内)', 'パイロット', 'セーラー', 'プラチナ'],
    '海外ブランド' => ['その他(海外)', 'アウロラ', 'カヴェコ', 'カランダッシュ', 'デルタ', 'パーカー', 'ビスコンティ', 'ペリカン', 'モンブラン', 'モンテグラッパ', 'ラミー']
  }.freeze
  NIB_SIZES = ['BB', 'B', 'MB', 'M', 'F', 'EF'].freeze

  def self.ransackable_attributes(auth_object = nil)
    %w[name brand]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[name brand]
  end
end
