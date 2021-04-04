class Event < ActiveRecord::Base
    belongs_to :user #belongs to a user that created it
    # belongs_to :location
end