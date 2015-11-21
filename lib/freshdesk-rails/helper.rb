module FreshdeskRails
  module Helper
    def self.indifferent_access(hash, key)
      hash[key.to_s] || hash[key.to_sym]
    end

    def self.current_locale
      return I18n.locale if defined?(::I18n)
    end
  end
end
