FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'rootroot'
    
    trait :invalid do
      email nil
    end

    
    # after(:create) { |user| user.confirm! }
  end

end
