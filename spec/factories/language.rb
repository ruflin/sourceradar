FactoryGirl.define do
  factory :language do
    trait :another do
      name "Ruby"
    end
    name "Java"
  end
end