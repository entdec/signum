# frozen_string_literal: true

require_dependency 'signum/application_cable/channel'

module Signum
  class SignalChannel < ApplicationCable::Channel
    def subscribed
      # NotifyChannel.broadcast_to(User.first, 'hi')
      stream_for current_user
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end
  end
end
