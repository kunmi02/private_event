class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :user_events
  has_many :attendees, through: :user_events

  validates :description, presence: true, length: { minimum: 3, maximum: 30 }
  validates :date, presence: true

  scope :upcoming_events, -> { where('date > ?', Time.now) }
  scope :past_events, -> { where('date <= ?', Time.now) }
end
