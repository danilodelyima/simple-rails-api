# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :relationships
  has_many :brands, -> { distinct }, through: :relationships

  has_many :friendships
  has_many :friends, through: :friendships

  validates :name, :email, :password, presence: true


  def follow!(brand)
    relationships.create!(brand_id: brand)
  end

  def unfollow!(brand)
    relationships.find_by(brand_id: brand).destroy
  end

  def friendship!(friend)
    friendships.create!(friend_id: friend)
  end
end
