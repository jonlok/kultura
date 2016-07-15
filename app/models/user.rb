class User < ActiveRecord::Base
  has_many :posts
  validates :name, length:{minimum:1}, presence:true
  validates :email, uniqueness: true
end
