Then /^I should be able to create equipment$/ do
  click_link "New Equipment"
  fill_in "Name", :with => "Super Soaker"
  fill_in "Price", :with => 500
  click_button "Save"
end

Then /^I should see the equipment$/ do
  equipment = Equipment.find_by_name('Super Soaker')
  within("[data-equipment='#{equipment.id}']") do
    assert has_content?('Super Soaker')
    assert has_content?('500')
  end
end

Given /^there is a "([^"]*)" equipment for "([^"]*)"$/ do |name, price|
  create(:equipment, :name => name, :price => price)
end

Then /^I should see the "([^"]*)" in the list of equipment for sale$/ do |name|
  equipment = Equipment.find_by_name(name)
  within("[data-equipment='#{equipment.id}']") do
    assert has_content?(name)
  end
end

When /^I purchase the "([^"]*)"$/ do |name|
  equipment = Equipment.find_by_name(name)
  within("[data-equipment='#{equipment.id}']") do
    click_button('Buy')
  end
end

Then /^I should see "([^"]*)" in my inventory$/ do |name|
  equipment = Equipment.find_by_name(name)
  within("[data-inventory]") do
    assert has_content?(equipment.name)
  end
end
