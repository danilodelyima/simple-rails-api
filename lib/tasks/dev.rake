namespace :dev do
  desc "populate the database"
  task setup: :environment do

    20.times do |i|
      Brand.create!(name: Faker::Company.name)
      puts "Brand #{i+1}"
    end

    50.times do |i|
      Product.create!(
        name: Faker::Coffee.blend_name,
        brand_id: Random.rand(1..20)
      )
      puts "Product #{i+1}"
    end

    10.times do |i|
      User.create!(
        name: Faker::Artist.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
      )
      puts "User #{i+1}"
    end

    10.times do |i|
      Relationship.create!(
        user_id: Random.rand(1..10),
        brand_id: Random.rand(1..20)
      )
      puts "Relationships #{i+1}"
    end

  end

end
