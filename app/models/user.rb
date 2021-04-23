class User < ActiveRecord::Base
    has_secure_password

    validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates :username, uniqueness: true, presence: true

    has_many :events
    has_many :locations, through: :events
end