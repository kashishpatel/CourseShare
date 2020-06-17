# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:default] = "%m/%d/%Y %l:%M %p"