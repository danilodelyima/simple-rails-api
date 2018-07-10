FactoryBot.define do
  factory :product do
    name { Faker::Coffee.blend_name }
    brand nil
  end
end
