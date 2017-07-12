class User < ActiveRecord::Base
  has_many :chatrooms, through: :messages
  has_many :messages
  validates :username, uniqueness: true, presence: true
end
