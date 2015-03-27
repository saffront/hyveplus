FactoryGirl.define do
  factory :authentication do

    trait :email do
      provider "email"
      uid ((SecureRandom.random_number)*1234567890 + 1234567890 ).to_i 
    end

  end
end
