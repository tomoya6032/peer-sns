class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  mount_uploader :image, ImageUploader
end
