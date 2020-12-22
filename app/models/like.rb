class Like < ApplicationRecord
  belongs_to :user
  belongs_to :miniblog

  validates_uniqueness_of :miniblog_id, scope: :user_id
end
