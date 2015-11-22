;(function($, undefined) {
  var LANGUAGES_KEYS = ['submitThanks', 'formTitle'];
  var FreshdeskRails = {}, widgets = $(), iframe, button, locale, orig_locale;
  var uri = $('<a/>')

  window.FreshdeskRails = FreshdeskRails;

  function openIframe() {
    button.unbind('click', openIframe);
    updateIframeLocale(orig_locale);
  }

  function updateIframeLocale (old_locale) {
    if(locale == old_locale) {
      return;
    }
    if(FreshdeskRails.languages && FreshdeskRails.languages.buttonText) {
      button.text(FreshdeskRails.languages.buttonText);
    }
    var url = FreshdeskRails.urls[locale];
    var old_url = FreshdeskRails.urls[old_locale];
    if(url == old_url) {
      return;
    }
    var iframe_url = iframe.attr('src');
    if(iframe_url.indexOf('loading') != -1) {
      return;
    }
    iframe_url = iframe_url.replace(old_url, url);
    if(FreshdeskRails.languages) {
      uri.attr('href', iframe_url);
      var parts = uri[0].search.split('&');
      LANGUAGES_KEYS.forEach(function (key) {
        var value = FreshdeskRails.languages[key];
        if(value) {
          for(var i = 0;i < parts.length;++i) {
            if(parts[i].indexOf(key + '=') == 0) {
              parts[i] = key + '=' + encodeURIComponent(value);
            }
          }
        }
      });
      uri[0].search = parts.join('&');
      iframe_url = uri.attr('href');
      if(FreshdeskRails.languages.buttonText) {
        console.log(FreshdeskRails.languages.buttonText);
        button.text(FreshdeskRails.languages.buttonText);
      }
    }
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
    }
  });

  $(document).ready(function () {
    if(FreshdeskRails.locale) {
      orig_locale = locale = FreshdeskRails.locale;
      delete FreshdeskRails.locale;
    }
  });
})(jQuery);
