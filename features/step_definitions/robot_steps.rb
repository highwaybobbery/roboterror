Given /^I create a robot$/ do
  click_link "Create a Robot"
  fill_in( "Robot name", with: "Robbie")
  save_and_open_page
  select("Medium", from: "Chassis")
  click_button( "Deployz!!" )
end

Then /^I see the robot$/ do
  visit root_path
  name = Robot.first.name
  page.should have_content name
end

Then /^I edit the robot$/ do
  click_link("edit")
  fill_in("Name", with: "Roberto")
  click_button ("ReDeployz!")
  page.should have_content("Roberto")
end

Then /^I delete the robot$/ do
  name = Robot.first.name
  click_link "delete"
  page.should_not have_content(name)
end

Then /^I view the robot$/ do
  name = Robot.first.name
  click_link(name)
end

Given /^There is a robot$/ do
  user = create(:user)
  robot = create(:robot, :user => user)
end
