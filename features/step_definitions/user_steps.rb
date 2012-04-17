Given /^I am signed in as an admin$/ do
  email = Factory.next(:email)
  user = create(:admin, :email => email)
  step %{I sign in with "#{email}"}
end

Given /^a user "([^"]*)" exists$/ do |email|
  create :user, :email => email
end

Then /^the user "([^"]*)" is not an admin$/ do |email|
  user = User.find_by_email(email)
  within(:css, "tr[data-user='#{user.id}']") do
    checkbox = find(:css, "input[type=checkbox]")
    checkbox.should_not be_checked
  end
end

When /^I make the user "([^"]*)" an admin$/ do |email|
  user = User.find_by_email(email)
  within(:css, "tr[data-user='#{user.id}']") do
    check("user_#{user.id}_admin")
    click_button "save"
  end
end

Then /^the user "([^"]*)" is an admin$/ do |email|
  user = User.find_by_email(email)
  within(:css, "tr[data-user='#{user.id}']") do
    checkbox = find(:css, "input[type=checkbox]")
    checkbox.should be_checked
  end
end
