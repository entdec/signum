require 'signum/engine'
require 'signum/active_record_helpers'
require 'signum/configuration'

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
        signalable_receiver.signals.create!(options)

      elsif signalable_receiver.respond_to?(:each)
        signalable_receiver.each { |signalable| signal(signalable, options) }
        nil
      end
    end

    # Signal about something that happened
    def info(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: 'info', icon: Signum.config.icons[:info]))
    end

    # Signal about an error
    def error(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: 'error', icon: Signum.config.icons[:error]))
    end

    # Signal about something that went sucessfully
    def success(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: 'success', icon: Signum.config.icons[:success]))
    end

    # Signal about something that could go wrong
    def warning(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: 'warning', icon: Signum.config.icons[:warning]))
    end
  end

  # Include helpers
  ActiveSupport.on_load(:active_record) { include ActiveRecordHelpers }
end
