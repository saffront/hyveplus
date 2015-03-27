FactoryGirl.define do
  factory :user do

    email 'morgan.freeman@gmail.com'
    password 'password'
    password_confirmation 'password'
    first_name 'Morgan'
    last_name 'Freeman'
    username 'morgan_freeman15'

    trait :invalid_user do
      email ''
      first_name ''
      last_name ''
      username ''
      password ''
      password_confirmation ''
    end

    trait :invalid_profile do
      email ''
      first_name ''
      last_name ''
      username ''
    end

    trait :invalid_password do
      password 'new_password'
      password_confirmation 'new_password_error'
    end

  end
end
