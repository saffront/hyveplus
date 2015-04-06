FactoryGirl.define do
  factory :user do
    email "morgan.freeman@gmail.com"
    password "password"
    password_confirmation "password"
    first_name "Morgan"
    last_name "Freeman"
    username "morgan-freeman"
  end

  trait :valid_login do
    email 'morgan.freeman@gmail.com'
    password 'password'
  end

  trait :invalid_login do
    email 'morgan.freeman@gmail.com'
    password 'wrong_password'
  end

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

  trait :admin do
    role 'admin'
  end

  trait :multiple_admins do
    sequence(:email) { |n| "morgan.freeman#{n}@gmail.com" }
    password "password"
    password_confirmation "password"
    sequence(:first_name) { |n| "Morgan#{n}" }
    sequence(:last_name) { |n| "Freeman#{n}" }
    sequence(:username) { |n| "morgan-freeman-#{n}" }
    role "admin"
  end

  trait :with_api_token do
    api_token "MLdYS4fs88TYVc48UIC0QQ"
  end
end
