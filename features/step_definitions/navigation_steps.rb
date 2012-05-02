When /^I visit the homepage$/ do
  visit root_path
end

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

When /^I visit the purchase equipment page$/ do
  visit root_path
  click_link "Purchase Equipment"
end

When /^I visit the admin equipment stats page$/ do
  step %{I visit the admin equipment page}
  within("tr[data-equipment='#{Equipment.first.id}']") do
    click_link "Edit"
  end
end
