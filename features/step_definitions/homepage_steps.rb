Given /^I am on the public homepage$/ do
  visit root_path
end

Then /^I should see the application name$/ do
  page.should have_css("h1", text: "RobotError")
end

Then /^I should see the application tagline$/ do
  page.should have_css("h2[data-role=tagline]")
end

Then /^I should see the welcome message$/ do
  page.should have_css("section[data-role=welcome-message]")
end
