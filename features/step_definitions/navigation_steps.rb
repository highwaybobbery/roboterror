When /^I visit the admin homepage$/ do
  visit root_path
  click_link "Admin"
end

When /^I visit the admin users page$/ do
  step %{I visit the admin homepage}
  click_link "Users"
end

When /^I visit the admin equipment page$/ do
  step %{I visit the admin homepage}
  click_link "Equipment"
end
