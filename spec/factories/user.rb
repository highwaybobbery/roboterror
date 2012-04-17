FactoryGirl.define do
 factory :admin, :parent => :user do
   admin true
 end
end
