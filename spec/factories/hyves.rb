FactoryGirl.define do
  factory :hyve do
    association :user
		sequence(:name) { |n| "hyve-#{n}" }
    sequence(:uuid) { |n| "hyve-#{n}" }
    sequence(:distance) { |n| "#{n}" }
		#pin "A123145190909"
		#lat 0.000000
		#lng 0.000000
  end

  trait :invalid do
		name ""
    uuid ""
    distance ""
  end

end
