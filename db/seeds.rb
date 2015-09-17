# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
50.times { Fabricate(:user) }
50.times { Fabricate(:topic) }

30.times do |i|
  User.find(i + rand(3)).topics << Topic.find(i + rand(3))
end
