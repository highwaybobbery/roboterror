Then /^I see the robot configuration page$/ do
  page.should have_css("h2", text: 'Configure Your Robot')
end

Then /^I see default robot statistics$/ do
  @robot = Robot.first
  @inventories = @robot.inventories
  @robot_stats = @robot.calculate_stats
  @all_stats = Stat.all
  @all_stats.each do |stat|
    within("[data-stat_id='#{stat.id}']") do
      page.should have_css('[data-role=name]', text: stat.name)
      page.should have_css('[data-role=value]', text: @robot_stats[stat.name])
    end
  end
end

Then /^I see updated robot statistics$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I see empty equipment slots$/ do
  @types = EquipmentType.all
  @types.each do |type|
    within("[data-type_id='#{type.id}']") do
      page.should have_css('[data-role=name]', text: type.name)
      page.should have_content('Empty')
      page.should have_button('Load')
    end
  end
end

Then /^I add the equipment to my robot$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I see the equipment on my robot$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I cannot add another equipment of the same type$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I detach the equipment$/ do
    pending # express the regexp above with the code you wish you had
end

Then /^I do not see the equipment on my robot$/ do
    pending # express the regexp above with the code you wish you had
end
