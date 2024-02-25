require "signum/engine"
require "signum/active_record_helpers"
require "signum/configuration"

module Signum
  class Error < StandardError
  end

  class << self
    def config
      @config ||= Configuration.new
    end

    def setup
      @config = Configuration.new
      yield config
    end

    # def i18n_store
    #   @i18n_store ||= Nuntius::I18nStore.new
    # end

    # Generic notice
    def signal(signalable_receiver, options)
      return unless signalable_receiver

      if signalable_receiver.is_a?(Signum.config.user_model_name.constantize)
        s = signalable_receiver.signals.create!(options)
        return s
      elsif signalable_receiver.respond_to?(:each)
        signalable_receiver.each { |signalable| signal(signalable, options) }
        return nil
      end
    end

    # Signal about something that happened
    def info(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: "info", icon: 'fa-solid fa-circle-info fa-lg text-sky-400'))
    end

    # Signal about an error
    def error(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: "error", icon: 'fa-solid fa-circle-xmark fa-lg text-red-400'))
    end

    # Signal about something that went sucessfully
    def success(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: "success", icon: 'fa-solid fa-circle-check fa-lg text-green-400'))
    end
  end

  # Include helpers
  ActiveSupport.on_load(:active_record) { include ActiveRecordHelpers }
end
