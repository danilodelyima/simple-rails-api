# == Schema Information
#
# Table name: brands
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :relationships
  has_many :users, through: :relationships

  validates :name, presence: true

  def as_json(options={})
    super(
      include: :products
    )
  end
end
