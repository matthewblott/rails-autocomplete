150.times do
  Movie.create(name: Faker::Movie.unique.title)
end

50.times do
  Country.create(name: Faker::Address.unique.country)
end
