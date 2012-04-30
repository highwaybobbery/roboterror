Then /^I create equipment$/ do
  click_link "New Equipment"
  fill_in "Name", :with => "Super Soaker"
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

Then /^I see the equipment in my inventory$/ do
  equipment = Equipment.first
  within("[data-inventory]") do
    page.should have_content(equipment.name)
  end
end

Then /^I have spent credits$/ do
  credits = 1000 - Equipment.first.price
  step %{I have "#{credits}" credits}
end
