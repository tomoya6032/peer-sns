class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many_attached :images
  # mount_uploader :image, ImageUploader
end
