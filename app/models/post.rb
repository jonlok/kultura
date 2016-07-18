class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :tag, presence: true
  validates :body, presence: true
  belongs_to :user
  def self.search(search)
  where("title ILIKE ?", "%#{search}%")
  where("tag ILIKE ?", "%#{search}%")
  where("body ILIKE ?", "%#{search}%")
  end
end
