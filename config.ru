# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require_relative 'config/.rubocop.yml'

run Rails.application
