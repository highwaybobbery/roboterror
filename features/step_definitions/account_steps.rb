When /^I sign up as "([^"]*)" with the password "([^"]*)"$/ do |email, password|
  visit root_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Sign Up"
end


Then /^I sign out$/ do
  click_link( "Sign out" )
end

Then /^I should be signed in as "([^"]*)"$/ do |email|
  page.should have_css( "[data-role=user-identification]", text: email )
end

Then /^I should not be signed in$/ do
  page.should_not have_css( "[data-role=user-identification]")
end

Given /^I am signed in as "([^"]*)"$/ do |email|
  step %{I sign up as "#{email}"}
end

