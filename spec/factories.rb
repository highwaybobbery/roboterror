FactoryGirl.define do
  # Sequences
  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :equipment_name do |n|
    "equipment#{n}"
  end

  sequence :robot_name do |n|
    "robot#{n}"
  end

  # Factories
  factory :robot do
    user

    chassis { Chassis.first }
    name { Factory.next(:robot_name) }
  end

  factory :user do
    email { Factory.next(:email) }

    balance 1000
    password 'password'

    factory :admin do
      admin true
    end
  end

  factory :equipment do
    name { Factory.next(:equipment_name) }
  end

  factory :stat do
    name 'pep'
    price 1
    price_growth 1.5
  end

  factory :equipment_stat do
    modifier 1
    stat { Factory.create(:stat) }
    equipment { Factory.create(:equipment) }
  end
end
