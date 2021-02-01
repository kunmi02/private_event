class Event < ApplicationRecord

    belongs_to :user

    has_many :event_attendee, foreign_key: 'event_id'
    has_many :attendees, through: :joiners

end


# event model  
#   belongs_to :user
#   has_many :event_attendee, foreign_key: 'event_attended_id'
#   has_many :attendees, through: :event_attendee

#   scope :upcoming_events, -> { where('date > ?', Time.now) }
#   scope :past_events, -> { where('date <= ?', Time.now) }
