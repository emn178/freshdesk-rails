require 'json'

module FreshdeskRails
  module ViewHelper
    include FreshdeskRails::ControllerHelper

    def freshdesk_tag
      javascript_include_tag("freshdesk.js")
    end

    def include_popup_freshdesk(arg1, widget_options, options = {})
      freshdesk_tag + freshdesk_script_tag(arg1, widget_options, options)
    end

    def include_freshdesk_locale(locale = nil)
      locale = freshdesk_locale(locale)
      javascript_tag "window.FreshdeskRails.locale=#{locale.to_json};"
    end

    private

    def freshdesk_script_tag(arg1, widget_options, options = {})
      javascript_tag freshdesk_init_script(arg1, widget_options, options) + freshdesk_urls_script
    end

    def freshdesk_init_script(arg1, widget_options, options = {})
      widget_options[:url] = freshdesk_url(options)
      "FreshWidget.init(\"#{arg1}\", #{widget_options.to_json});"
    end

    def freshdesk_urls_script
      script = "window.FreshdeskRails.urls=#{FreshdeskRails.configuration.urls.to_json};"
      if FreshdeskRails.configuration.locale_cookie
        script += "window.FreshdeskRails.locale_cookie=#{FreshdeskRails.configuration.locale_cookie.to_json};"
      end
      script
    end
  end
end
