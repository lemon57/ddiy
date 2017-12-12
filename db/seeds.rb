# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


puts 'destroying'
Request.destroy_all
Job.destroy_all
OwnerProfile.destroy_all
WorkerProfile.destroy_all
User.destroy_all

puts 'destroyed'

profilepics = [""]
jobpics = [""]
skill = ["builder, painter, carpenter, cleaner"]
jobstatus = ["start date agreed, in progress, finished, paid"]
requeststatus = ["pending, accepted"]

puts "Creating fakes"
10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    # TO DO correct spelling (rename column) location
    loacation: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    photo: profilepics.sample
    )

  owner = OwnerProfile.create(
    # user_id:
    verification_status: rand(5)
    )
  worker = WorkerProfile.create(
    # user_id:
    verification_status: rand(5),
    skill_area: skill.sample,
    bio: Faker::Lorem.sentence(3, false, 4),
    price_per_hour: rand(19...47).to_i,
    dob: Faker::Date.birthday(18, 65),
    available: true,
    completed_tasks: rand(1...78).to_i,
    rating: rand(3...5)
    )

  job = Job.create(
    status: jobstatus.sample,
    # owner_id:
    )

  request = Request.create(
    # title:
    # description:
    status: requeststatus.sample
    # job_id:
    # worker_id:
    # photo: jobpics.sample
    )



end
puts 'finished'
