class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :miniblogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_miniblogs, through: :likes, source: :miniblog

  validates :nickname, presence: true
  def already_liked?(miniblog)
    self.likes.exists?(miniblog_id: miniblog.id)
  end
end
