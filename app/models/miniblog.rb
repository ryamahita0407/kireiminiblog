class Miniblog < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  
  with_options presence: true do
    validates :title, :text, :images
  end
end
