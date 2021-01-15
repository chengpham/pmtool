
Comment.delete_all()
Discussion.delete_all()
Project.delete_all()
Task.delete_all()
User.delete_all

PASSWORD='supersecret'
super_user=User.create(
    first_name: 'Jon',
    last_name: 'Snow',
    email: 'js@interfell.gov',
    password: PASSWORD
)
10.times do 
  first_name= Faker::Name.first_name 
  last_name= Faker::Name.last_name 
  User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name}.#{last_name}@example.com",
      password: PASSWORD,
      created_at: Faker::Date.backward(days: 365)
  )
end
users=User.all

50.times do
  p=Project.create(
    title: Faker::Books::Dune.character,
    description: Faker::Books::Dune.quote,
    due_date: Faker::Date.forward(days: 23),
    created_at: Faker::Date.backward(days: 14),
    user: users.sample
  )
  if p.valid?
    p.discussions = rand(1..15).times.map do
      d=Discussion.create(
        title: Faker::TvShows::SouthPark.character,
        description: Faker::TvShows::SouthPark.quote,
        created_at: Faker::Date.backward(days: 14),
        user: users.sample
      )
    end
    p.comments = rand(0..15).times.map do
      Comment.create(
        body: Faker::Hipster.paragraph,
        discussion: p.discussions.sample,
        created_at: Faker::Date.backward(days: 14),
        user: users.sample
      )
    end
  end
end

100.times do 
  Task.create(
    title: Faker::Games::Pokemon.move,
    due_date: Faker::Date.forward(days: 23),
    project: Project.all.sample,
    done: [true,false].sample,
    created_at: Faker::Date.backward(days: 14),
    user: users.sample
  )
end

puts Project.count
puts Task.count
puts Discussion.count
puts Comment.count