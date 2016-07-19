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

   has_attached_file :image, styles: {
    medium: "300x300>",
    thumb: "100x100>"
   }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
