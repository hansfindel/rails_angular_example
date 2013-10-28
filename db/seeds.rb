#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

names = ["Alfredo", "Bernardita", "Camilo", "Daniela", "Elena", "Francisco", "Gerardo", "Hodor", "Ignacio", "Jaimee", "Pedro", "Pablo", "Sebastián", "Franco", "Joaquín", "Gabriel", "Eduardo", "Camila"]
last_names = ["Armas", "Benavente", "Contreras", "Caviedes", "Restaino", "Ariztía", "Vidal", "Ramirez", "Fernandes", "Lahm", "Lam"]

puts "Start creating users"
r = Random.new
names.each do |name|
	last_names.each do |last|
		User.create({name: name, last_name: last, points: r.rand(100)})
	end
end
puts "End creating users"