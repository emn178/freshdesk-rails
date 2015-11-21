# freshdesk-rails

[![Build Status](https://api.travis-ci.org/emn178/freshdesk-rails.png)](https://travis-ci.org/emn178/freshdesk-rails)
[![Coverage Status](https://coveralls.io/repos/emn178/freshdesk-rails/badge.svg?branch=master)](https://coveralls.io/r/emn178/freshdesk-rails?branch=master)

A library to integrate with [freshdesk](https://freshdesk.com/) help desk.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freshdesk-rails'
```

Make sure you have:

```ruby
gem 'jquery-rails'
```

And then execute:

    bundle

Or install it yourself as:

    gem install freshdesk-rails

For rails, create config `config/initializers/freshdesk-rails.rb`
```ruby
FreshdeskRails.configure do |config|
  config.default_locale = :en
  # list your help desks with locales.
  config.urls = {
    'zh-TW' => 'http://tw.example.freshdesk.com',
    'ja-JP' => 'http://jp.example.freshdesk.com',
    'en' => 'http://example.freshdesk.com'
  }

  # set your name of locale in cookie, this is for turbolinks
  config.locale_cookie = :locale
end
```

## Usage

In rails controllers, you can call `redirect_to_freshdesk` to redirect with locale. 
```ruby
# using I18n.locale
redirect_to_freshdesk
```
Or you can assaign locale manaully
```ruby
redirect_to_freshdesk :locale => :en
```

In view, you can use `include_popup_freshdesk` to include javascript plugin.
```ruby
# in <head/>
include_popup_freshdesk "", {"queryString": "&widgetType=popup&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback", "utf8": "✓", "widgetType": "popup", "buttonType": "text", "buttonText": "Help", "buttonColor": "white", "buttonBg": "#09a8be", "alignment": "2", "offset": "350px", "submitThanks": "Thanks for your feedback", "formHeight": "500px" }
```
If you use turbolinks without enabling locale_cookie, you can assaign locale manually.
```Ruby
# in <body/>
# using I18n.locale
include_freshdesk_locale
```
Or
```Ruby
include_freshdesk_locale :en
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/freshdesk-rails  
Author: emn178@gmail.com
