FactoryBot.define do
  factory :topic do
    association :user
    trait :root do
      sequence(:title) { |n| "root topic ##{n}" }
      level { 0 }
    end

    trait :root_child do
      association :parent, factory: [:topic, :root]

      sequence(:title) { |n| "root child topic ##{n}" }
      level { 1 }
    end

    trait :level_2 do
      association :parent, factory: [:topic, :root_child]

      sequence(:title) { |n| "level 2 topic ##{n}" }
      level { 2 }
    end
  end
end
