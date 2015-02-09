FactoryGirl.define do
  factory :user do
    email 'bob@gmail.com'
    password 'rootroot'
    
    trait :invalid do
      email ''
    end

    
    # after(:create) { |user| user.confirm! }
  end

end
