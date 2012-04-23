FactoryGirl.define do
  # Sequences
  sequence :email do |n|
    "user#{n}@example.com"
  end

  # Factories
  factory :robot do
    user

    chassis { Chassis.first }
    name 'robbie'
  end

  factory :user do
    email

    balance 1
    password 'password'

    factory :admin do
      admin true
    end
  end
end
