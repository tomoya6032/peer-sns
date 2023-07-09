class Profile < ApplicationRecord
  belongs_to :user

  validates :bio, length: { maximum: 160 } # Twitterのbioと同じく、文字数制限を設ける
  validates :location, length: { maximum: 30 } # 長すぎる場所情報を避けるために文字数制限を設ける
  validates :website, length: { maximum: 100 } # 長すぎるURLを避けるために文字数制限を設ける
  validates :birth_date, presence: true # 生年月日は必須とする
end
