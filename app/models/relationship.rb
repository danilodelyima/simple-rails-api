# == Schema Information
#
# Table name: relationships
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  brand_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :brand
end
