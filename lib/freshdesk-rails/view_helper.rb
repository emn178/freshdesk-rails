require 'json'

module FreshdeskRails
  module ViewHelper
    include FreshdeskRails::ControllerHelper

    def freshdesk_tag
      javascript_include_tag("freshdesk.js")
    end

    def include_popup_freshdesk(options = {})
      freshdesk_tag + freshdesk_script_tag(options)
    end

    def include_freshdesk_locale(locale = nil)
      locale = freshdesk_locale(locale)
      javascript_tag "window.FreshdeskRails.locale=#{locale.to_json};"
    end

    private

    def freshdesk_script_tag(options = {})
      javascript_tag freshdesk_init_script(options) + freshdesk_urls_script
    end

    def freshdesk_init_script(options = {})
      widget_options = {}
      options.each do |key, value|
        widget_options[key.to_s] = value unless key.to_s == 'locale'
      end
      widget_options["widgetType"] = "popup"
      query_string = widget_options["queryString"] || ""
      params = Hash[CGI.parse(query_string).map {|key,values| [key, values[0] || true]}]
      params["formTitle"] ||= widget_options.delete("formTitle")
      params["submitThanks"] ||= widget_options["submitThanks"]
      params["widgetType"] = "popup"
      query_string = URI.encode_www_form(params)
      widget_options["queryString"] = "&#{query_string}" unless query_string.empty?
      widget_options[:url] = freshdesk_url(options)
      "FreshWidget.init('', #{widget_options.to_json});"
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
