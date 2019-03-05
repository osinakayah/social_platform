FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name 'John'
    last_name 'Doe'
    phone_number '08160831611'
    birth_day '2019-03-02 00:00:00'
    password 'secret'
    password_confirmation 'secret'
    gender 0
  end
end