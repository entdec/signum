module Signum
  class ApplicationController < Signum.config.base_controller.constantize
    protect_from_forgery with: :exception
  end
end
