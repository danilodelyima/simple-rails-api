require 'rails_helper'

RSpec.describe Brand, type: :model do

  it { should have_many(:products).dependent(:destroy) }

  it { should have_many(:users) }

  it { should validate_presence_of(:name) }
end
