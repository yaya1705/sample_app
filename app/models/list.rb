class List < ApplicationRecord
  # Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができます
  has_one_attached :image
  
  # validatesで対象とする項目を指定し、入力されたデータのpresence（存在）をチェック
  # trueと記述すると、データが存在しなければならないという設定になりま
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
end
