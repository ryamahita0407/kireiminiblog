class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :miniblogs
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_miniblogs, through: :likes, source: :miniblog

  def already_liked?(miniblog)
    self.likes.exists?(miniblog_id: miniblog.id)
  end
end
