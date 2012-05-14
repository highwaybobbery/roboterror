Given /^I am on the public homepage$/ do
  visit root_path
end

Then /^I see the sign in link$/ do
  page.should have_link("Sign in")
end

Then /^I see the sign up form$/ do
  page.should have_css("section[data-role=sign-up]")
end

Then /^I see a list of my robots$/ do
  robots = User.first.robots
  within("[data-role=robots]") do
    robots.each do |robot|
      within("[data-robot_id='#{robot.id}']") do
        page.should have_css("[data-role=name]", text: robot.name)
        page.should have_css("[data-role=won]", text: robot.won.to_s)
        page.should have_css("[data-role=lost]", text: robot.lost.to_s)
        page.should have_css("[data-role=price]", text: robot.calculate_price.to_s)

        page.should have_css("[data-role=edit]")
        page.should have_css("[data-role=delete]")

        page.should_not have_css("[data-role=view]")
        page.should_not have_css("[data-role=fight]")
      end
    end
  end
end

Then /^I see a list of other robots$/ do
  robots = Robot.not_owned_by(User.first)
  within("[data-role=opponents]") do
    robots.each do |robot|
      within("[data-robot_id='#{robot.id}']") do
        page.should have_css("[data-role=name]", text: robot.name)
        page.should have_css("[data-role=won]", text: robot.won.to_s)
        page.should have_css("[data-role=lost]", text: robot.lost.to_s)
        page.should have_css("[data-role=price]", text: robot.calculate_price.to_s)

        page.should_not have_css("[data-role=edit]")
        page.should_not have_css("[data-role=delete]")

        page.should have_css("[data-role=view]")
        page.should have_css("[data-role=fight]")
      end
    end
  end
end
