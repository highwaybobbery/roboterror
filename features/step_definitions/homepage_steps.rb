Given /^I am on the public homepage$/ do
  visit root_path
end

Then /^I should see the sign in link$/ do
  page.should have_link("Sign in")
end

Then /^I should see the sign up form$/ do
  page.should have_css("section[data-role=sign-up]")
end
