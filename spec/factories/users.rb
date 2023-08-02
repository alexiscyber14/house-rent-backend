FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    name { 'Test User' }
    email { generate(:email) }
    password { 'password' }
    password_confirmation { 'password' }

    trait :admin do
      role { :admin }
    end
  end
end
