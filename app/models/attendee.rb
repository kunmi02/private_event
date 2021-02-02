class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :events
  has_many :invites, foreign_key: 'event_id'
  
end
