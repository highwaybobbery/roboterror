FactoryGirl.define do
  factory :robot do
    user
    chassis { Chassis.first }
    name "robbie"
  end
end
