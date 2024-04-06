FactoryBot.define do
  factory :user do
    email { "connie@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
