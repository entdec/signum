# frozen_string_literal: true

require_dependency 'signum/application_cable/channel'

module Signum
  class SignalChannel < ApplicationCable::Channel
    def subscribed
      stream_for current_user
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end

    def display(data)
      signal = Signum::Signal.find_by_id(data['signal_id'])

      return unless signal

      signal.display!
    end

    def close(data)
      signal = Signum::Signal.find_by_id(data['signal_id'])

      return unless signal

      signal.close!
    end
  end
end
