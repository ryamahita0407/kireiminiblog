class Miniblog < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments
  
  with_options presence: true do
    validates :title, :text, :images
  end
end
