Fabricator(:topic) do
  title { Faker::Company.name }
  body { Faker::Lorem.paragraph }
end
