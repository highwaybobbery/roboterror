When /^I sign up as "([^"]*)"$/ do |email|
  visit root_path
  fill_in "Email", with: email
  click_button "Sign Up"
end

Then /^I should be signed in as "([^"]*)"$/ do |email|
  page.should have_css( "[data-role=user-identification]", text: email )
end

Given /^the following user exists$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

Then /^I should not be logged in$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an error$/ do
  pending # express the regexp above with the code you wish you had
end

