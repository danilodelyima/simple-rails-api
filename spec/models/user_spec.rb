require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }
  let!(:friend) { create(:user) }
  let!(:brand) { create(:brand) }

  it { should have_many(:brands) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:password) }

  it '#follow!' do
    user.follow!(brand.id)
    expect(user.brands).to eq([brand])
  end

  it '#unfollow!' do
    Relationship.create!(user_id: user.id, brand_id: brand.id)
    user.unfollow!(brand.id)
    expect(user.brands).to be_empty
  end

  it '#friendship!' do
    user.friendship!(friend.id)
    expect(user.friends).to eq([friend])
  end
end
