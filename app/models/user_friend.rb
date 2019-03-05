class UserFriend < ApplicationRecord
  validates_presence_of :user_id, :friend_id
end
