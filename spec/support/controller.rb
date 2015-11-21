class Controller
  attr_accessor :redirect_url

  include FreshdeskRails::ControllerHelper

  def redirect_to(url)
    @redirect_url = url
  end
end
