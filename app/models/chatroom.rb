class Chatroom < ActiveRecord::Base
  before_validation :sanitize, :slugify
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, uniqueness: true, case_sensitive: false


  def to_param
    self.slug
  end

  def slugify
    self.slug = self.topic.downcase.gsub(" ", "-")
  end

  def sanitize
    self.topic = self.topic.strip
  end
end
