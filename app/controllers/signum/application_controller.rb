module Signum
  class ApplicationController < Signum.config.base_controller.constantize
    protect_from_forgery with: :exception
    include Signum.config.admin_authentication_module.constantize if Signum.config.admin_authentication_module
  end
end
