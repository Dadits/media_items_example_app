FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{ n }@example.com" }
    password "password123"
  end
end