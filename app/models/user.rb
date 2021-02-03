class User < ApplicationRecord
  has_many :events
  has_many :user_events
  has_many :attended_events, through: :user_events

  validates :username, presence: true, length: { minimum: 3, maximum: 30 }
  validates :email, presence: true, length: { minimum: 5, maximum: 30 }
end
