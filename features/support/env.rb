require 'bundler'

Bundler.setup(:production)

require 'capybara/cucumber'

# Chrome is not a driver by default
# Ths registers one with capybara
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Change this to choose a driver
# :selenium - Firefox
# :chrome - Google-chrome
Capybara.default_driver = :chrome

require 'google_shopping'