class Comment < ApplicationRecord
  validates_presence_of :comment, :post_id
  belongs_to :post
  belongs_to :user
end
