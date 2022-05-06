RANDOM_HUNDRED_CHARS="hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello worldhello world"

FactoryBot.define do
  factory :project do
    sequence(:title){ |n| Faker::Job.title + "#{n}"}
    description { Faker::Job.field + "#{RANDOM_HUNDRED_CHARS}"}
    due_date { Faker::Date.forward(days: 365) } 
  end

end

