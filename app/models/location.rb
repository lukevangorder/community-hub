class Location < ActiveRecord::Base

    validates :name, length: {minimum: 3}
    validates :address, length: {in: 3...40}
    validates :info, length: {maximum: 500}

    has_many :events
    has_many :users, through: :events
end