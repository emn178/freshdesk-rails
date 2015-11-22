require 'spec_helper'

RSpec.describe FreshdeskRails::ViewHelper do
  include FreshdeskRails::ViewHelper
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::JavaScriptHelper

  describe "#freshdesk_tag" do
    subject { freshdesk_tag }
    it { should eq "<script src=\"/javascripts/freshdesk.js\"></script>" }
  end

  describe "#include_popup_freshdesk" do
    context "without locale" do
      subject { include_popup_freshdesk({"queryString": "&widgetType=popup&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback", "utf8": "✓", "widgetType": "popup", "buttonType": "text", "buttonText": "Help", "buttonColor": "white", "buttonBg": "#09a8be", "alignment": "2", "offset": "350px", "submitThanks": "Thanks for your feedback", "formHeight": "500px" }) }
      it { should eq "<script src=\"/javascripts/freshdesk.js\"></script><script>\n//<![CDATA[\nFreshWidget.init('', {\"queryString\":\"&widgetType=popup&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback\",\"utf8\":\"\u2713\",\"widgetType\":\"popup\",\"buttonType\":\"text\",\"buttonText\":\"Help\",\"buttonColor\":\"white\",\"buttonBg\":\"#09a8be\",\"alignment\":\"2\",\"offset\":\"350px\",\"submitThanks\":\"Thanks for your feedback\",\"formHeight\":\"500px\",\"url\":\"http://example.freshdesk.com\"});window.FreshdeskRails.urls={\"zh-TW\":\"http://tw.example.freshdesk.com\",\"ja-JP\":\"http://jp.example.freshdesk.com\",\"en\":\"http://example.freshdesk.com\"};window.FreshdeskRails.locale_cookie=\"locale\";\n//]]>\n</script>" }
    end

    context "with locale zh-TW" do
      subject { include_popup_freshdesk({"queryString": "&widgetType=popup&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback", "utf8": "✓", "widgetType": "popup", "buttonType": "text", "buttonText": "Help", "buttonColor": "white", "buttonBg": "#09a8be", "alignment": "2", "offset": "350px", "submitThanks": "Thanks for your feedback", "formHeight": "500px", :locale => 'zh-TW' }) }
      it { should eq "<script src=\"/javascripts/freshdesk.js\"></script><script>\n//<![CDATA[\nFreshWidget.init('', {\"queryString\":\"&widgetType=popup&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback\",\"utf8\":\"\u2713\",\"widgetType\":\"popup\",\"buttonType\":\"text\",\"buttonText\":\"Help\",\"buttonColor\":\"white\",\"buttonBg\":\"#09a8be\",\"alignment\":\"2\",\"offset\":\"350px\",\"submitThanks\":\"Thanks for your feedback\",\"formHeight\":\"500px\",\"url\":\"http://tw.example.freshdesk.com\"});window.FreshdeskRails.urls={\"zh-TW\":\"http://tw.example.freshdesk.com\",\"ja-JP\":\"http://jp.example.freshdesk.com\",\"en\":\"http://example.freshdesk.com\"};window.FreshdeskRails.locale_cookie=\"locale\";\n//]]>\n</script>" }
    end

    context "when locale_cookie nil" do
      before {
        allow(FreshdeskRails.configuration).to receive(:locale_cookie).and_return(nil)
      }
      subject { include_popup_freshdesk({"queryString": "&widgetType=popup&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback", "utf8": "✓", "widgetType": "popup", "buttonType": "text", "buttonText": "Help", "buttonColor": "white", "buttonBg": "#09a8be", "alignment": "2", "offset": "350px", "submitThanks": "Thanks for your feedback", "formHeight": "500px" }) }
      it { should eq "<script src=\"/javascripts/freshdesk.js\"></script><script>\n//<![CDATA[\nFreshWidget.init('', {\"queryString\":\"&widgetType=popup&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback\",\"utf8\":\"\u2713\",\"widgetType\":\"popup\",\"buttonType\":\"text\",\"buttonText\":\"Help\",\"buttonColor\":\"white\",\"buttonBg\":\"#09a8be\",\"alignment\":\"2\",\"offset\":\"350px\",\"submitThanks\":\"Thanks for your feedback\",\"formHeight\":\"500px\",\"url\":\"http://example.freshdesk.com\"});window.FreshdeskRails.urls={\"zh-TW\":\"http://tw.example.freshdesk.com\",\"ja-JP\":\"http://jp.example.freshdesk.com\",\"en\":\"http://example.freshdesk.com\"};\n//]]>\n</script>" }
    end

    context "with less options" do
      subject { include_popup_freshdesk({"utf8": "✓", "buttonType": "text", "buttonText": "Help", "buttonColor": "white", "buttonBg": "#09a8be", "alignment": "2", "offset": "350px", "submitThanks": "Thanks for your feedback", "formHeight": "500px", "formTitle": "Ask Something..." }) }
      it { should eq "<script src=\"/javascripts/freshdesk.js\"></script><script>\n//<![CDATA[\nFreshWidget.init('', {\"utf8\":\"\u2713\",\"buttonType\":\"text\",\"buttonText\":\"Help\",\"buttonColor\":\"white\",\"buttonBg\":\"#09a8be\",\"alignment\":\"2\",\"offset\":\"350px\",\"submitThanks\":\"Thanks for your feedback\",\"formHeight\":\"500px\",\"widgetType\":\"popup\",\"queryString\":\"&formTitle=Ask+Something...&submitThanks=Thanks+for+your+feedback&widgetType=popup\",\"url\":\"http://example.freshdesk.com\"});window.FreshdeskRails.urls={\"zh-TW\":\"http://tw.example.freshdesk.com\",\"ja-JP\":\"http://jp.example.freshdesk.com\",\"en\":\"http://example.freshdesk.com\"};window.FreshdeskRails.locale_cookie=\"locale\";\n//]]>\n</script>" }
    end
  end

  describe "#include_freshdesk_locale" do
    context "without input" do
      subject { include_freshdesk_locale }
      it { should eq "<script>\n//<![CDATA[\nwindow.FreshdeskRails.locale=\"en\";\n//]]>\n</script>" }
    end

    context "with locale zh-TW" do
      subject { include_freshdesk_locale('zh-TW') }
      it { should eq "<script>\n//<![CDATA[\nwindow.FreshdeskRails.locale=\"zh-TW\";\n//]]>\n</script>" }
    end
  end
end
