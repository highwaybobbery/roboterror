Then /^I see the equipment stats page$/ do
  page.should have_content("Modify Equipment")
  page.should have_css("[data-role=equipment_price]")
end

Then /^I add stats to the equipment$/ do
  within("[data-role=edit_equipment_attributes]") do
    select :health, from: 'edit_equipment_stat_stat'
    fill_in 'edit_equipment_stat_modifier', with: '1'
    page.should have_css('td[data-for=price]')
    click_button "Save"
  end
end

Then /^I see the equipment with an updated price$/ do
  equipment_stat = EquipmentStat.first
  page.should have_css("[data-equipment_stat_id]")
end

Then /^I see the equipment stats$/ do
  equipment_stat = EquipmentStat.first
  within("[data-equipment_stat_id='#{equipment_stat.id}']") do
    page.should have_content(equipment_stat.stat.name)
    page.should have_content(equipment_stat.modifier)
    page.should have_content(equipment_stat.price)
    page.should have_button("Edit")
    page.should have_button("Remove")
  end
end

Given /^I remove the equipment stat$/ do
  equipment_stat = EquipmentStat.first
  page.should have_css('form#delete_equipment_stat_form')
  within("[data-equipment_stat_id='#{equipment_stat.id}']") do
    click_button("Remove")
  end
end

Then /^the equipment should have no stats$/ do
  page.should_not have_css("[data-equipment_stat_id]")
end
