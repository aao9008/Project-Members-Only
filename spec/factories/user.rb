FactoryBot.define do
  factory :user do
    username { "testUser" }
    email { "testUser@example.com" }
    password { "1234test" }
  end
end