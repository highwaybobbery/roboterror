Then /^I should be able to create equipment$/ do
  click_link "New Equipment"
  fill_in "Name", :with => "Super Soaker"
  fill_in "Price", :with => 500
  click_button "Save"
end

Then /^I should see the equipment$/ do
  equipment = Equipment.find_by_name('Super Soaker')
  within("tr[data-equipment='#{equipment.id}']") do
    has_content?('Super Soaker')
    has_content?('500')
  end
end
