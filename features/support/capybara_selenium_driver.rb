require 'capybara'
require 'capybara\dsl'
require 'selenium-webdriver'

class Capybara::Driver::Selenium < Capybara::Driver::Base
  def javascript=(javascript)
    return if @javascript == javascript
    @javascript = javascript
    @browser.quit if !@browser.nil?
    @browser = create_browser(@javascript)
    at_exit do
      @browser.quit
    end
  end

  def browser
      unless @browser
        @javascript = true
        @browser = create_browser(@javascript)
        at_exit do
          @browser.quit
        end
      end
      @browser
  end

  private

  def create_browser(javascript = true)
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile["javascript.enabled"] = javascript
    return Selenium::WebDriver.for :firefox, :profile => profile
  end
end