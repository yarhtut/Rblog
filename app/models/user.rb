class User < ActiveRecord::Base
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }
  has_many :comments
end
