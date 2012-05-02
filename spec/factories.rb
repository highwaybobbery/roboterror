FactoryGirl.define do
  # Factories
  factory :chassis do
    name { Factory.next(:chassis_name) }
  end

  factory :equipment do
    name { Factory.next(:equipment_name) }
    price 0
    chassis { Factory.create(:chassis) }
    equipment_type { Factory.create(:equipment_type) }
  end

  factory :equipment_stat do
    modifier 1
    stat { Factory.create(:stat) }
    equipment { Factory.create(:equipment) }
  end

  factory :equipment_type do
    name { Factory.next(:equipment_type) }
  end

  factory :inventory do
    user { Factory.create(:user) }
    equipment { Factory.create(:equipment) }
  end

  factory :robot do
    user

    chassis { Chassis.find_or_create_by_name('Medium') }
    name { Factory.next(:robot_name) }
  end

  factory :stat do
    name { Factory.next(:stat_name) }
    price 1
    price_growth 1.5
  end

  factory :user do
    email { Factory.next(:email) }

    balance 1000
    password 'password'

    factory :admin do
      admin true
    end
  end

  # Sequences
  sequence :chassis_name do |n|
    "chassis#{n}"
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :equipment_name do |n|
    "equipment#{n}"
  end

  sequence :equipment_type do |n|
    "type#{n}"
  end

  sequence :robot_name do |n|
    "robot#{n}"
  end

  sequence :stat_name do |n|
    "stat#{n}"
  end
end
