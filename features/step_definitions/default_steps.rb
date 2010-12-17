require 'chronic'

Then /^I should be redirected to the (.*) page$/ do |requested_page|
  page.driver.current_url.should include @@pages[requested_page]
end

When /^I click "([^\"]*)"$/ do |link|
  click_link_or_button link
end

Then /^I should see the error message "([^\"]*)"$/ do |message|
  page.should have_content message
end

Then /^I should not see the error message "([^\"]*)"$/ do |message|
  page.should have_no_content message
end

Given /^I set "([^\"]*)" to be "([^\"]*)"$/ do |field_name, value|
  fill_in field_name, :with => value
end

Given /^javascript is (.*)/ do |state|
  page.driver.javascript = state == "enabled" 
end

Then /^the page should show "([^\"]*)"$/ do |content|
   page.should have_content content
end

When /^the field "([^\"]*)" should contain "([^\"]*)"$/ do |field_name, field_text|
  find_field(field_name).value.should == field_text
end

When /^I check "([^\"]*)"$/ do |checkbox|
  check(checkbox)
end

