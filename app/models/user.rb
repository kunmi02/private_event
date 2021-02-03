class User < ApplicationRecord
  has_many :events
  # has_many :joiners
  has_many :user_events
  has_many :attended_events, through: :user_events
end

# user model
# has_many :events
# has_many :event_attendee, foreign_key: 'attendee_id'
# has_many :event_attended, through: :event_attendee
