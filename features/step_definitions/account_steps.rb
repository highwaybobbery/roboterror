When /^I sign up as "([^"]*)"$/ do |email|
  visit root_path
  fill_in "Email", with: email
end

Then /^I should be logged in$/ do
  pending # express the regexp above with the code you wish you had
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

