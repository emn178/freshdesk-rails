require 'spec_helper'

RSpec.describe FreshdeskRails::ControllerHelper do
  include FreshdeskRails::ControllerHelper

  describe "#freshdesk_url" do
    subject { url }

    context "without options" do
      let(:url) { freshdesk_url }
      it { should eq "http://example.freshdesk.com" }
    end

    context "when I18n.locale = 'ja-JP'" do
      before { allow(I18n).to receive(:locale).and_return('ja-JP') }
      let(:url) { freshdesk_url }
      it { should eq "http://jp.example.freshdesk.com" }
    end

    context "with locale notfound" do
      let(:url) { freshdesk_url(:locale => 'notfound') }
      it { should eq "http://example.freshdesk.com" }
    end
  end

  describe "#redirect_to_freshdesk" do
    subject { controller }
    let(:controller) { Controller.new }

    context "without options" do
      before { 
        controller.redirect_to_freshdesk
      }
      its(:redirect_url) { should eq "http://example.freshdesk.com" }
    end
  end
end
