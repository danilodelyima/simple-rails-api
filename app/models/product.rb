# == Schema Information
#
# Table name: products
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  brand_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :brand

  validates :name, presence: true
end
