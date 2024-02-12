class Pen < ApplicationRecord
  mount_uploader :pen_image, PenImageUploader
  belongs_to :user
  belongs_to :ink, optional: true
  has_many :favorite_pen, dependent: :destroy
  has_many :favorited_pens, through: :favorite_pen, source: :pen

  validates :name, presence: true, length: { maximum: 40 }
  validates :brand, presence: true
  validates :description, length: { maximum: 140 }, allow_blank: true

  BRANDS = {
    '国内ブランド' => ['パイロット', 'セーラー', 'プラチナ', 'その他(国内)'],
    '海外ブランド' => ['アウロラ', 'カヴェコ', 'カランダッシュ', 'デルタ', 'パーカー', 'ビスコンティ', 'ペリカン', 'モンブラン', 'モンテグラッパ', 'ラミー', 'その他(海外)']
  }.freeze
  NIB_SIZES = ['BB（極太）', 'B（太字）', 'M（中字）', 'MF（中細）', 'F（細字）', 'EF（極細）', 'その他'].freeze

  def self.ransackable_attributes(auth_object = nil)
    %w[name brand]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[name brand]
  end
end
