class Event < ApplicationRecord
  belongs_to :user
  default_scope -> {order(starts: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140}
end
