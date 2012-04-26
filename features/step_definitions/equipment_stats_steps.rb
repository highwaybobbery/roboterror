Then /^I see the equipment stats page$/ do
  page.should have_content("Equipment Stats")
end

Then /^I add stats to the equipment$/ do
  page.should have_css(table[data-role='
end
