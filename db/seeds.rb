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

profilepics = ["https://avatars3.githubusercontent.com/u/10404286?v=4, https://avatars1.githubusercontent.com/u/17966032?v=4, https://avatars3.githubusercontent.com/u/26773096?v=4, https://avatars3.githubusercontent.com/u/31242346?v=4, https://avatars1.githubusercontent.com/u/32898865?v=4, https://avatars3.githubusercontent.com/u/32458816?v=4, https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/fitmrgiij2z7yulaizzq.jpg, https://avatars2.githubusercontent.com/u/22260870?v=4, https://avatars1.githubusercontent.com/u/28978099?v=4, https://avatars3.githubusercontent.com/u/30000902?v=4, https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/q9hyd6ydeg9mcqrsztsp.jpg, https://avatars1.githubusercontent.com/u/32573223?v=4, https://avatars0.githubusercontent.com/u/32680605?v=4, https://avatars1.githubusercontent.com/u/32390077?v=4, https://avatars3.githubusercontent.com/u/8993868?v=4, https://avatars2.githubusercontent.com/u/32763684?v=4, https://avatars3.githubusercontent.com/u/32510017?v=4"]
jobpics = ["http://tolpuddleoldchapeltrust.org/wp-content/uploads/2017/04/interior-after-emergency-repairs-to-east-1.jpg, http://24hourhomerepairs.co.uk/wp-content/uploads/emergency-repair-fix.jpg, https://i.pinimg.com/736x/83/ff/e1/83ffe1be8e46022388ac59058481a175--this-old-house-old-houses.jpg, http://www.britanniaglass.co.uk/wp-content/uploads/2016/07/broken-window-pane.jpg, https://i.pinimg.com/736x/45/46/f9/4546f987ac78291177dc304f1c983c64--broken-window-abandoned-mansions.jpg, http://24hourhomerepairs.co.uk/wp-content/uploads/collapsed20ceiling-537x365.jpg, https://i.pinimg.com/736x/97/b0/26/97b02603943af3ded35c5609a01e8963--how-to-remove-paint-front-door-makeover.jpg, https://st3.idealista.com/news/archivos/2015-11/x_15_planta_1.jpg?sv=SIwNrPrE, https://imgs.nestimg.com/flat_149_m2_madrid_108242024033105479.jpg, https://img3.idealista.com/blur/HOME_WI_1500/0/id.pro.es.image.master/7b/43/fb/179363433.jpg"]
skill = ["Painting", "Plumbing", "Electrics", "Carpentry", "Cleaning", "Handyman", "Other"]
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
end
10.times do
  owner = OwnerProfile.create(
    verification_status: rand(5)
    )
    owner.user = user
end
10.times do
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
end
10.times do
  job = Job.create(
    status: jobstatus.sample,
    title: Faker::Lorem.sentence(word_count=4),
    description: Faker::Lorem.sentence(3, false, 4),
    photo: jobpics.sample
    )
    job.owner_profile = owner
end
10.times do
  request = Request.create(
    status: requeststatus.sample
    )
    # job_id:
    request.job = job
    # worker_id:
    request.worker_profile = worker
end
puts 'finished'
