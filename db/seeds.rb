# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'wait while seeding.....'

  12.times do

    Realty.create(name:Faker::TwinPeaks.location , description:Faker::Lorem.paragraph(3, true))

  end

Realty.all.each { |z| puts z.name}

puts "--------------------"
puts ""
puts "that was it."
