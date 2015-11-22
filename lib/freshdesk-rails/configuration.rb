module FreshdeskRails
  class Configuration
    attr_accessor :urls, :default_locale

    def initialize(options = {})
      options.each { |key, value| 
        instance_variable_set("@#{key}", value)
      }
    end

    def validate!
      raise 'default_locale is not definded in urls.' if Helper.indifferent_access(urls, default_locale).nil?
    end
  end
end
