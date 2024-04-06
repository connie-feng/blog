FactoryBot.define do
  factory :testimonial do
    name { Faker::Name.name }
    city { Faker::Address.city }
    content { Faker::Quote.famous_last_words }
    published_at { nil }

    trait :published do
      published_at { 1.week.ago }
    end
  end
end
