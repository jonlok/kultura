class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :tag, presence: true
  validates :body, presence: true
  belongs_to :user
  def self.search(search)
    where("title ILIKE '%#{search}%' OR tag ILIKE '%#{search}%' OR body ILIKE '%#{search}%'")
  end
  before_save :generate_timestamp
  def generate_timestamp
    self.timestamp = Time.now
  end
end
