module FreshdeskRails
  module ControllerHelper
    def freshdesk_url(options = {})
      locale = freshdesk_locale(Helper.indifferent_access(options, :locale))
      Helper.indifferent_access(FreshdeskRails.configuration.urls, locale)
    end

    def redirect_to_freshdesk(options = {})
      redirect_to(freshdesk_url(options))
    end

    private

    def freshdesk_locale(locale)
      locale = locale || Helper.current_locale
      urls = FreshdeskRails.configuration.urls
      if Helper.indifferent_access(urls, locale).nil?
        FreshdeskRails.configuration.default_locale
      else
        locale
      end
    end
  end
end
