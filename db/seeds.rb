# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.destroy_all
Doctor.destroy_all
City.destroy_all
Specialty.destroy_all

4.times do
City.create(name: Faker::Address.city)
end
# specialty_array = ["Ophtalmologue", "Oncologue", "généraliste", "Dermatologue"]
specialty_array = [{name:"Ophtalmologue"}, {name:"Oncologue"}, {name:"généraliste"}, {name:"Dermatologue"}]

doctors_array = [{first_name: "Jean",last_name: 'Tigana',zip_code: '343719', city_id: City.all.sample.id},{first_name: 'Michel',last_name: 'Platini',zip_code: 'zipcode2', city_id: City.all.sample.id},{first_name: 'René',last_name: 'Girard',zip_code: 'zipcode3', city_id: City.all.sample.id}]
patient_array = [{first_name: 'Richard', last_name: 'Virenque', city_id: City.all.sample.id}, {first_name: 'Laurent',last_name: 'Fignon', city_id: City.all.sample.id}, {first_name: 'Lance',last_name: 'Armstrong', city_id: City.all.sample.id}, {first_name: 'Laurent',last_name: 'Jalabert', city_id: City.all.sample.id}]

patient_array.each do |patient|
  Patient.create(patient)
end
=
doctors_array.each do |doctor|
  Doctor.create(doctor)
end

specialty_array.each do |specialty|
  Specialty.create(specialty)
end

12.times do
  Appointment.create(doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id, date: (Faker::Date.between(2.days.ago, 30.days.from_now)), city_id: City.all.sample.id)
end
8.times do
  JoinTableDoctorSpecialty.create(doctor_id: Doctor.all.sample.id, specialty_id: Specialty.all.sample.id)
end
# 12.times do
#   Doctor.all.sample.patients << Patient.all.sample


# end
# 12.times { |i| Appointment.find(i+1).update(date: (Faker::Date.between(2.days.ago, 30.days.from_now)))}
#
#
# 12.times { |i| Appointment.find(i).update (date: (Faker::Date.between(2.days.ago, 30.days.from_now))}
#
#   rand(1..10).times do
#
#     docotrFaker::Date.between(2.days.ago, 30.days.away)
#   end
#   patient_array.create(album)
#   puts "#{index} albums créés"
# end
#
# bicycle_234 = Bicycle.create
# bicycle_234.users << User.create(name: "Michel")
# Pour ce premier exercice, nous allons t'aider et te donner les models à créer :
#
#     un model doctor, qui a comme attributs :
#         un first_name, qui est un string
#         un last_name, qui est un string
#         un specialty, qui est un string
#         un zip_code, qui est un string
#     un model patient, qui a comme attributs :
#         un first_name, qui est un string
#         un last_name, qui est un string
#     un model appointment, qui a comme attributs :
#         un date, qui est un datetime
#
# Une fois les attributs fixés, on s'attaque aux relations :
#
#     Un appointment ne peut avoir qu'un seul doctor, mais un doctor peut avoir plusieurs appointment.
#     Un appointment ne peut avoir qu'un seul patient, mais un patient peut avoir plusieurs appointment.
#     Un doctor peut avoir plusieurs patient, au travers des appointments, et vice versa.
#
# Je t'invite à créer les models et les migrations puis à les passer.
