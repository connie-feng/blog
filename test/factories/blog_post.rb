FactoryBot.define do
  factory :blog_post do
    title { "blog post" }
    published_at { nil }

    trait :published do
      published_at { 1.month.ago }
    end

    trait :scheduled do
      published_at { 1.month.from_now }
    end
  end
end
