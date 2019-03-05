class Post < ApplicationRecord
  validates_presence_of :content, :user_id
  validates_length_of :content, maximum: 100
  belongs_to :user
  self.per_page = 10

  has_many :comments
end
