class Rep < ActiveRecord::Base
    belongs_to :user
    has_many :contacts
    validates_uniqueness_of :name, scope: :user_id
end