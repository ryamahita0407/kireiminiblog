class Miniblog < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  
  with_options presence: true do
    validates :title, :text, :images
  end
end
