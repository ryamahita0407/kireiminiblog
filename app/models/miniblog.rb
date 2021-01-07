class Miniblog < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  with_options presence: true do
    validates :title, :text, :images
  end

  validate :validate_images

  private
  def validate_images
    return if images.count == 2
  
    errors.add(:images, 'You can upload 2 images')
  end
end
