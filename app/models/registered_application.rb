class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events
  scope :visible_to, -> (user) { user ? all : where(public: true) }

end
