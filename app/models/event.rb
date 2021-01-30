class Event < ApplicationRecord

    has_many :joiners
    has_many :users, through: :joiners

end
