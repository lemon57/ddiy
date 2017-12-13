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

profilepics = ["https://avatars3.githubusercontent.com/u/10404286?v=4, https://avatars1.githubusercontent.com/u/17966032?v=4, https://avatars3.githubusercontent.com/u/26773096?v=4, https://avatars3.githubusercontent.com/u/31242346?v=4, https://avatars1.githubusercontent.com/u/32898865?v=4, https://avatars3.githubusercontent.com/u/32458816?v=4"]
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
    location: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    photo: profilepics.sample
    )

  owner = OwnerProfile.create(
    verification_status: rand(5)
    )
    owner.user = user

  worker = WorkerProfile.create(
    verification_status: rand(5),
    skill_area: skill.sample,
    bio: Faker::Lorem.sentence(3, false, 4),
    price_per_hour: rand(19...47).to_i,
    dob: Faker::Date.birthday(18, 65),
    available: true,
    completed_tasks: rand(1...78).to_i,
    rating: rand(3...5)
    )
    # user_id:
    worker.user = user

  job = Job.create(
    status: jobstatus.sample,
    title: Faker::Lorem.sentence(word_count=4),
    description: Faker::Lorem.sentence(3, false, 4),
    photo: jobpics.sample
    )
    job.owner_profile = owner


  request = Request.create(
    status: requeststatus.sample
    )
    # job_id:
    request.job = job
    # worker_id:
    request.worker_profile = worker



end
puts 'finished'
