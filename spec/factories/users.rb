FactoryBot.define do
  factory :admin do
    name                  { "admin" }
    email                 { "admin@example.com" }
    password              { "password0#" }
    password_confirmation { "password0#" }
    description           { "description_test" }
    user_icon             { "no_icon" }
    admin                 { true }
  end

  factory :user do
    name                  { "user01" }
    email                 { "user01@example.com" }
    password              { "password01" }
    password_confirmation { "password01" }
    description           { "description_test" }
    user_icon             { "no_icon" }
    admin                 { false }
  end
end
