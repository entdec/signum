# frozen_string_literal: true

module Signum
  module Options
    module ClassMethods
      def option(name, default: nil)
        attr_accessor(name)

        schema[name] = default
      end

      def schema
        @schema ||= {}
      end
    end

    def set_defaults!
      self.class.schema.each do |name, default|
        instance_variable_set(:"@#{name}", default)
      end
    end

    def self.included(cls)
      cls.extend(ClassMethods)
    end
  end

  class Configuration
    include Options

    option :logger, default: Rails.logger
    option :user_model_name, default: "User"
    option :hide_after, default: 3000
    option :base_controller, default: "::ApplicationController"
    option :base_service, default: "::ApplicationService"
    option :base_service_context, default: "::ApplicationContext"
    option :current_user, default: -> {}
    option :drawer_notifications_container_id, default: ->(signalable = nil, id = nil) {}
    option :balloon_notifications_container_id, default: ->(signalable = nil, id = nil) {}
    option :icons,
      default: {info: "fa-solid fa-circle-info fa-lg",
                error: "fa-solid fa-square-xmark fa-lg",
                success: "fa-solid fa-circle-check fa-lg",
                warning: "fa-solid fa-triangle-exclamation fa-lg",
                unread_main: "fa-solid fa-bell-ring",
                read_main: "fa-solid fa-bell"}

    def initialize
      set_defaults!
    end
  end

  module Configurable
    attr_writer :config

    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end
    alias_method :setup, :configure

    def reset_config!
      @config = Configuration.new
    end
  end
end
