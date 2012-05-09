Then /^I create equipment$/ do
  click_link "New Equipment"
  fill_in "Name", :with => "Super Soaker"
  select "Primary Weapon", from: 'Type'
  click_button "Save"
end

Given /^an equipment with stats exists$/ do
  equipment = create(:equipment)
  create :equipment_stat, equipment: equipment
end

Then /^I see the equipment$/ do
  equipment = Equipment.first
  within("[data-equipment='#{equipment.id}']") do
    page.should have_content(equipment.name)
  end
end

Then /^I delete the equipment$/ do
  equipment = Equipment.first
  within("[data-equipment='#{equipment.id}']") do
  click_link "Delete"
  end
end

Then /^I do not see the equipment$/ do
  page.should_not have_css("[data-equipment]")
end

Given /^I own the equipment$/ do
  equipment = Equipment.first
  user = User.first
  create(:inventory, equipment: equipment, user: user)
end

Then /^I see the equipment in the list of equipment for sale$/ do
  equipment = Equipment.first
  within("[data-equipment='#{equipment.id}']") do
    page.should have_content(equipment.name)
  end
end

When /^I purchase the equipment$/ do
  equipment = Equipment.first
  within("[data-equipment='#{equipment.id}']") do
    click_button('Buy')
  end
end

Then /^I see my inventory$/ do
  inventories = Inventory.unassigned
  within('[data-role=inventory]') do
    inventories.each do |inventory|
      within("[data-inventory_id='#{inventory.id}'][data-equipment_id='#{inventory.equipment_id}']") do
        page.should have_content(inventory.equipment.name)
        page.should have_content(inventory.equipment.price)
        page.should have_content(inventory.equipment.equipment_type.name)
      end
    end
  end
end

Then /^I see the equipment in my inventory$/ do
  equipment = Equipment.first
  within("[data-role=inventory]") do
    page.should have_content(equipment.name)
  end
end

Then /^I do not see the equipment in my inventory$/ do
  equipment = Equipment.first
  within("[data-role=inventory]") do
    page.should_not have_content(equipment.name)
  end
end

Then /^I have spent credits$/ do
  credits = 1000 - Equipment.first.price
  step %{I have "#{credits}" credits}
end
