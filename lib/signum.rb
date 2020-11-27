require 'signum/engine'
require 'signum/active_record_helpers'

module Signum
  class Error < StandardError; end

  class << self
    # attr_reader :config

    # def setup
    #   @config = Configuration.new
    #   yield config
    # end

    # def i18n_store
    #   @i18n_store ||= Nuntius::I18nStore.new
    # end

    # Generic notice
    def signal(signalable, options)
      return unless signalable

      signalable.signals.create!(options)
    end

    # Signal about something that happened
    def info(signalable, options)
      return unless signalable

      signalable.signals.create!(options.merge(kind: 'info'))
    end

    # Signal about an error
    def error(signalable, options)
      return unless signalable

      signalable.signals.create!(options.merge(kind: 'error'))
    end

    # Signal about something that went sucessfully
    def success(signalable, options)
      return unless signalable

      signalable.signals.create!(options.merge(kind: 'success'))
    end
  end

  # Include helpers
  ActiveSupport.on_load(:active_record) do
    include ActiveRecordHelpers
  end
end
