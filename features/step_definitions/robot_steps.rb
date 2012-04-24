Given /^I create a robot named "([^"]*)"$/ do |name|
  click_link "Create a Robot"
  fill_in( "Robot name", with: "#{name}")
  select("Medium", from: "Chassis")
  click_button( "Deployz!!" )
end

Then /^I should see the robot "([^"]*)" on my homepage$/ do |name|
  visit root_path
  page.should have_content name
end

Then /^I should be able to edit "Robbie"$/ do
  click_link("edit")
  fill_in("Name", with: "Roberto")
  click_button ("ReDeployz!")
  page.should have_content("Roberto")
end

Then /^I should be able to delete "([^"]*)"$/ do |robot|
  click_link "delete"
  page.should_not have_content(robot)
end

Then /^I should be able to view "([^"]*)"$/ do |robot|
  click_link(robot)
end

Given /^There is a robot$/ do
  user = create(:user)
  robot = create(:robot, :user => user)
end

Then /^I should be awesome$/ do
  pending # express the regexp above with the code you wish you had
end
