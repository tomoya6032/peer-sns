class Tweet < ApplicationRecord
  validates :content, presence: true
  # validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true
  # validate :validate_title_and_content_length
  
  belongs_to :user
  has_many :likes
  has_many :replies
  has_many_attached :images
  # mount_uploader :image, ImageUploader

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

  def like_count
    likes.count
  end

end
