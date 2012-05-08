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
  robot = Robot.first
  stats = robot.calculate_stats

  within("[data-role=robot_stats]") do
    stats.each do |stat_id, value|
      within("[data-stat_id='#{stat_id}']") do
        page.should have_css("[data-role=value]", text: value.to_s)
      end
    end
  end
end

Then /^I see empty equipment slots$/ do
  @types = EquipmentType.all
  @types.each do |type|
    within("[data-equipment_type_id='#{type.id}']") do
      page.should have_css('[data-role=name]', text: type.name)
      page.should have_content('Empty')
      page.should have_button('Load')
    end
  end
end

Then /^I add the equipment to my robot$/ do
  inventory = Inventory.first
  within("[data-role=robot_equipment]") do
    within("[data-equipment_type_id='#{inventory.equipment.equipment_type.id}']") do
      select(inventory.equipment.name, from: "inventory_for_type_#{inventory.equipment.equipment_type.id}")
      click_button("Load")
    end
  end
end

Then /^I see the equipment on my robot$/ do
  inventory = Inventory.first
  within("[data-role=robot_equipment]") do
    within("[data-equipment_type_id='#{inventory.equipment.equipment_type.id}']") do
      page.should_not have_css("#inventory_for_type_#{inventory.equipment.equipment_type.id}")
      page.should have_css("[data-inventory_id='#{inventory.id}']", text: inventory.equipment.name)
    end
  end
end

Then /^I detach the equipment$/ do
  inventory = Inventory.first
  within("[data-role=robot_equipment]") do
    within("[data-equipment_type_id='#{inventory.equipment.equipment_type.id}']") do
      click_button("Unload")
    end
  end
end

Then /^I do not see the equipment on my robot$/ do
  inventory = Inventory.first
  within("[data-role=robot_equipment]") do
    within("[data-equipment_type_id='#{inventory.equipment.equipment_type.id}']") do
      page.should_not have_css("[data-inventory_id='#{inventory.id}']", text: inventory.equipment.name)
    end
  end
end
