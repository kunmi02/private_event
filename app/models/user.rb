class User < ApplicationRecord
has_many :events, foreign_key: :user_id
has_many :created_events, through: :joiner, source: :event
end
