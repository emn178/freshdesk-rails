;(function($, undefined) {
  var FreshdeskRails = {}, widgets = $(), iframe, button, locale, orig_locale;

  window.FreshdeskRails = FreshdeskRails;

  function openIframe() {
    button.unbind('click', openIframe);
    updateIframeLocale(orig_locale);
  }

  function updateIframeLocale (old_locale) {
    if(locale == old_locale) {
      return;
    }
    var url = FreshdeskRails.urls[locale];
    var old_url = FreshdeskRails.urls[old_locale];
    if(url == old_url) {
      return;
    }
    var iframe_url = iframe.attr('src');
    iframe_url = iframe_url.replace(old_url, url);
    iframe.attr('src', iframe_url);
  }

  function updateLocale(new_locale) {
    if(locale == new_locale) {
      return;
    }
    var old_locale = locale;
    locale = new_locale;
    updateIframeLocale(old_locale);
  }

  $(document).on('page:before-unload', function() {
    if(!widgets.length) {
      widgets = $('#FreshWidget, #freshwidget-button');
      iframe = $('#freshwidget-frame');
      button = $('.freshwidget-theme');
      button.click(openIframe);
      $('#freshwidget-close, #freshwidget-overlay').click(function () {
        updateIframeLocale(orig_locale);
      });
    }
  });
  $(document).on('page:load', function() {
    $('body').append(widgets);
    if(FreshdeskRails.locale) {
      updateLocale(FreshdeskRails.locale);
      delete FreshdeskRails.locale;
    } else if(FreshdeskRails.locale_cookie) {
      updateLocale(getCookie(FreshdeskRails.locale_cookie));
    }
  });

  $(document).ready(function () {
    if(FreshdeskRails.locale) {
      orig_locale = locale = FreshdeskRails.locale;
      delete FreshdeskRails.locale;
    } else if(FreshdeskRails.locale_cookie) {
      orig_locale = locale = getCookie(FreshdeskRails.locale_cookie);
    }
  });

  function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
  }
})(jQuery);
