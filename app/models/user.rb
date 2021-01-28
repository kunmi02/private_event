class User < ApplicationRecord

    # add_foreign_key "joiners", "events"
    # add_foreign_key "joiners", "users"

    has_many :creators,
             foreign_key: :event_id, 
             class_name: 'event'
end
