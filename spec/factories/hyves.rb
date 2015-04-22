FactoryGirl.define do
  factory :hyve do
		sequence(:name) { |n| "hyve-name-#{n}" }
    sequence(:uuid) { |n| "hyve-#{n}" }
    distance "2"
  end

  trait :invalid do
		name ""
    uuid ""
    distance ""
  end

end
