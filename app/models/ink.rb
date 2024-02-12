class Ink < ApplicationRecord
  mount_uploader :ink_image, InkImageUploader
  belongs_to :user
  has_many :pens, dependent: :nullify
  has_many :favorite_ink, dependent: :destroy
  has_many :favorited_inks, through: :favorite_ink, source: :ink

  validates :name, presence: true, length: { maximum: 40 }
  validates :brand, presence: true
  validates :description, length: { maximum: 140 }, allow_blank: true
  
  BRANDS = {
    '国内ブランド' => ['セーラー', 'トノアンドリムズ', 'パイロット', 'プラチナ', 'ご当地インク', 'オリジナルインク', 'その他(国内)'],
    '海外ブランド' => ['アウロラ', 'エルバン', 'カヴェコ', 'ダイアミン', 'ペリカン', 'モンブラン', 'ラミー', 'その他(海外)']
  }.freeze
  COLORS = ['黒', 'ブルーブラック', '茶', 'グレー', '青', '紫', '緑', 'オレンジ', '赤', 'ピンク', 'その他'].freeze
  INK_LEVELS = ['40ml以上', '39ml〜11ml', '10ml以下'].freeze

  def self.ransackable_attributes(auth_object = nil)
    %w[name brand color]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[name brand]
  end

  def full_name
    "#{brand} #{name}"
  end
end
