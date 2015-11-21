if defined?(::Rails::Engine)
  module FreshdeskRails
    class Engine < ::Rails::Engine
      initializer "freshdesk" do
        ActiveSupport.on_load :action_controller do
          include FreshdeskRails::ControllerHelper
        end
        ActiveSupport.on_load :action_view do
          include FreshdeskRails::ViewHelper
        end
        Rails.application.config.assets.precompile += %w( freshdesk.js )
      end
    end
  end
end
