FactoryGirl.define do
  factory :user do
    first_name 'Bob'
    last_name 'Smith'
    email { Faker::Internet.email }
    password 'rootroot'
    
    trait :invalid do
      email nil
    end

    
    after(:create) { |user| user.confirm! }
  end

end
