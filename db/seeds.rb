
Comment.delete_all()
Discussion.delete_all()
Project.delete_all()
Task.delete_all()

50.times do
  p=Project.create(
    title: Faker::Books::Dune.character,
    description: Faker::Books::Dune.quote,
    due_date: Faker::Date.forward(days: 23),
    created_at: Faker::Date.backward(days: 14),
  )
  if p.valid?
    # p.tasks = rand(0..15).times.map do 
    #   Task.create(
    #     title: Faker::TvShows::HowIMetYourMother.catch_phrase,
    #     due_date: Faker::Date.forward(days: 23),
    #     done: [true,false].sample,
    #     created_at: Faker::Date.backward(days: 14),
    #   )
    # end
    p.discussions = rand(1..15).times.map do
      d=Discussion.create(
        title: Faker::TvShows::SouthPark.character,
        description: Faker::TvShows::SouthPark.quote,
        created_at: Faker::Date.backward(days: 14)
      )
    end
    p.comments = rand(0..15).times.map do
      Comment.create(
        body: Faker::Hipster.paragraph,
        discussion: p.discussions.sample,
        created_at: Faker::Date.backward(days: 14)
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
  )
end

puts Project.count
puts Task.count
puts Discussion.count
puts Comment.count