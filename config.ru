# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

use Rack::ReverseProxy do
  reverse_proxy /^\/blog(\/.*)$/, 'http://hyve.flywheelsites.com$1', username: ENV["FLYWHEEL_USERNAME"], password: ENV["FLYWHEEL_PASSOWRD"], timeout: 500, preserve_host: true
  #reverse_proxy '/blog', 'http://hyve.flywheelsites.com$1', username: ENV["FLYWHEEL_USERNAME"], password: ENV["FLYWHEEL_PASSOWRD"], timeout: 500, preserve_host: true
end

run Rails.application
