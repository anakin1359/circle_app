FactoryBot.define do
  factory :admin do
    name                  { "admin" }
    # email                 { "admin@example.com" }
    sequence(:email)      { |n| "admin00#{n}@example.com" }
    password              { "password0#" }
    password_confirmation { "password0#" }
    description           { "description_test" }
    user_icon             { "no_icon" }
    admin                 { true }
  end

  factory :user do
    name                  { "user01" }
    sequence(:email)      { |n| "user00#{n}@example.com" }
    password              { "password01" }
    password_confirmation { "password01" }
    description           { "description_test" }
    user_icon             { "no_icon" }
    admin                 { false }
  end
end
