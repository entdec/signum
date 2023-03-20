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

      signal(signalable, options.merge(kind: "info", icon: '<path class="text-sky-400" stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />'))
    end

    # Signal about an error
    def error(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: "error", icon: '<path class="text-red-400" stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />'))
    end

    # Signal about something that went sucessfully
    def success(signalable, options)
      return unless signalable

      signal(signalable, options.merge(kind: "success", icon: '<path class="text-green-400" stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />'))
    end
  end

  # Include helpers
  ActiveSupport.on_load(:active_record) { include ActiveRecordHelpers }
end
