FactoryGirl.define do
  factory :hyvelet do
    association :user
		name "Hyvelet1"
		pin "A123145190909"
		lat 0.000000
		lng 0.000000
		ismissing false
		ismissing false
  end
  
  trait :invalid do
      name ''
      pin ''
  end

end
