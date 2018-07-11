# == Schema Information
#
# Table name: friendships
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  friend_id  :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
