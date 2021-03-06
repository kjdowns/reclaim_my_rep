class User < ActiveRecord::Base
    has_secure_password
    has_many :reps
    has_many :contacts
    validates_uniqueness_of :username
end