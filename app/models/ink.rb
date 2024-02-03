class Ink < ApplicationRecord
  mount_uploader :ink_image, InkImageUploader
  belongs_to :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :brand, presence: true
  validates :description, length: { maximum: 140 }, allow_blank: true
  
  BRANDS = {
    '国内ブランド' => ['その他(国内)', 'オリジナルインク', 'ご当地インク', 'セーラー', 'トノアンドリムズ', 'パイロット', 'プラチナ'],
    '海外ブランド' => ['その他(海外)', 'アウロラ', 'エルバン', 'カヴェコ', 'ダイアミン', 'ペリカン', 'モンブラン', 'ラミー']
  }.freeze
  COLORS = ['黒', 'ブルーブラック', '茶', 'グレー', '青', '紫', '緑', 'オレンジ', '赤', 'ピンク', 'その他'].freeze
  INK_LEVELS = ['40ml以上', '39ml〜11ml', '10ml以下'].freeze

  def self.ransackable_attributes(auth_object = nil)
    %w[name brand]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[name brand]
  end
end
