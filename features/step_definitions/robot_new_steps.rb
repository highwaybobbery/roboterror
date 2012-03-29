Then /^I should be able to create a robot$/ do
  click_link "Create a Robot"
  fill_in( "Robot name", with: "Robbie" )
  click( "Deployz!!" )
end

Then /^I should see the robot on my hompage$/ do
  pending # express the regexp above with the code you wish you had
end
