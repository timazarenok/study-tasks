require './info.rb'
require 'capybara'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome
Capybara.configure do |config|
  config.default_max_wait_time = 10
  config.default_driver = :selenium
end

URL = 'https://www.onliner.by/news'

browser = Capybara.current_session
driver = browser.driver.browser
browser.visit URL

p Info.new(driver).get_names 
