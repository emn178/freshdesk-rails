require 'simplecov'
require 'coveralls'

SimpleCov.add_filter "/spec/"
SimpleCov.add_filter "engine.rb"

if ENV["COVERAGE"]
  SimpleCov.start
elsif ENV["COVERALLS"]
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  Coveralls.wear!
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'freshdesk-rails'
require 'action_view'
require 'rspec/its'

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each do |file|
  require file
end

FreshdeskRails.configure do |config|
  config.default_locale = :en
  config.urls = {
    'zh-TW' => 'http://tw.example.freshdesk.com',
    'ja-JP' => 'http://jp.example.freshdesk.com',
    'en' => 'http://example.freshdesk.com'
  }
  config.locale_cookie = :locale
end
