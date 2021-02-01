class User < ApplicationRecord

    has_many :events
    has_many :joiners
    has_many :event_attended, through: :joiners

end

# user model
# has_many :events
# has_many :event_attendee, foreign_key: 'attendee_id'
# has_many :event_attended, through: :event_attendee
