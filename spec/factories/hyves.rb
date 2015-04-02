FactoryGirl.define do
  factory :hyve do
		sequence(:name) { |n| "hyve-#{n}" }
    sequence(:uuid) { |n| "hyve-#{n}" }
    sequence(:distance) { |n| "#{n}" }
  end

  trait :invalid do
		name ""
    uuid ""
    distance ""
  end

end
