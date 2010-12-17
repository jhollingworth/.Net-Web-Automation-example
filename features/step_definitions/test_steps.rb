When /^I set the date to be (.*)$/ do |date|
  Given "I set \"Date\" to be \"#{parse(date)}\""
end

When /^the page should show (.*)'s date$/ do |date|
  Then "the page should show \"#{parse(date)}\""
end

Given /^I fill in the form correctly$/ do
  Given "I set \"Name\" to be \"Foo\""
  Given "I set the date to be tomorrow"
end

Given /^I am on the test page$/ do
  visit '/test.aspx'
end
