class Event < ActiveRecord::Base
    belongs_to :user #belongs to a user that created it
end