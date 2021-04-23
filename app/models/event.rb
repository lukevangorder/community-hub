class Event < ActiveRecord::Base

    validates :name, length: {minimum: 3}
    validates :info, length: {maximum: 500}

    belongs_to :user #belongs to a user that created it
    belongs_to :location

    accepts_nested_attributes_for :location

    def normalize_time
        "#{self.starts_at.strftime('%b %-d, %Y at %k:%M')} - #{self.ends_at.strftime('%b %-d, %Y at %k:%M')}"
    end
end