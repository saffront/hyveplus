FactoryGirl.define do
  factory :hyve do
    association :user
		name "Hyve1"
		pin "A123145190909"
		lat 0.000000
		lng 0.000000
  end
  
  trait :invalid do
      name ''
      pin ''
  end

end
