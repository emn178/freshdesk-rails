require 'spec_helper'

RSpec.describe FreshdeskRails::Configuration do
  subject { configuration }
  let(:configuration) { FreshdeskRails::Configuration.new(:default_locale => :en) }
  
  describe "#initialize" do
    its(:default_locale) { should eq :en }
  end
end
