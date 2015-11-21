require "freshdesk-rails/version"
require "freshdesk-rails/configuration"
require "freshdesk-rails/helper"
require "freshdesk-rails/controller_helper"
require "freshdesk-rails/view_helper"
require "freshdesk-rails/engine"

module FreshdeskRails
  def self.configure(&block)
    yield configuration
    configuration.validate!
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
