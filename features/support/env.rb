require 'cucumber'
require 'capybara'
require 'capybara\dsl'
require 'ruby-debug'
require 'selenium-webdriver'

require File.dirname(__FILE__) + '/capybara_selenium_driver'
require File.dirname(__FILE__) + '/dot_net_xpath'
require File.dirname(__FILE__) + '/expando'

World Capybara

Before do
  dir = File.dirname(__FILE__)
  Dir[dir + '/../helpers/*.rb'].each{ |f| require f }

  @context = Expando.new
  @config = YAML.load(File.read dir + '/../../config.yml')

  Capybara.default_driver = :selenium
  Capybara.app_host = "http://#{@config['base_url']}"
end
