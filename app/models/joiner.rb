class Joiner < ApplicationRecord

  belongs_to :event_attended, class_name: 'Event'
  belongs_to :attendee, class_name: 'User'

end

  # joiner model
  # belongs_to :event_attended, class_name: 'Event'
  # belongs_to :attendee, class_name: 'User'
