# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all()
Discussion.destroy_all()
Project.destroy_all()
Task.destroy_all()
20.times do
  Comment.create(
    body: Faker::Hipster.paragraph,
    created_at: Faker::Date.backward(days: 14),
  )
  Discussion.create(
    title: Faker::TvShows::SouthPark.character,
    description: Faker::TvShows::SouthPark.quote,
    created_at: Faker::Date.backward(days: 14),
  )
  Project.create(
    title: Faker::Books::Dune.character,
    description: Faker::Books::Dune.quote,
    due_date: Faker::Date.forward(days: 23),
    created_at: Faker::Date.backward(days: 14),
  )
  Task.create(
    title: Faker::TvShows::HowIMetYourMother.catch_phrase,
    due_date: Faker::Date.forward(days: 23),
    created_at: Faker::Date.backward(days: 14),
  )
end
comment = Comment.all
discussion = Discussion.all
project = Project.all
task = Task.all
puts "Generated #{discussion.count} discussions, #{comment.count} comments, #{project.count} projects and #{task.count} tasks."