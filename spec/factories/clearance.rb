FactoryGirl.define do

  sequence :email do |n|
    p "email sequence: #{n}"
    "user#{n}@example.com"
  end

  factory :user do
    email
    password "password"
  end

end
