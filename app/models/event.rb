class Event < ApplicationRecord

    has_many :posts, 
                foreign_key: :user_id, 
                class_name: 'user'
end
