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
i = 0
names.each do |name|
	last_names.each do |last|
		path = "/assets/octocat/#{i}.jpg"
		i = (i.to_i + 1) % 15
		User.create({name: name, last_name: last, points: r.rand(100), image_path: path})
	end
end
puts "End creating users"