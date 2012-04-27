Then /^I see the equipment stats page$/ do
  page.should have_content("Equipment Stats")
end

Then /^I add stats to the equipment$/ do
  within("tr[data-role=edit_equipment_attributes]") do
    select :health, from: 'edit_equipment_stat_stat'
    fill_in 'edit_equipment_stat_modifier', with: '1'
    page.should have_css('td[data-for=price]')
    click_button "Save"
  end
end

Then /^I see the equipment with an updated price$/ do
  equipment_stat = EquipmentStat.first
  page.should have_css("tr[data-equipment_stat='#{equipment_stat.id}']")
end
