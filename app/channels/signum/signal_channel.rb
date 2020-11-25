# frozen_string_literal: true

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
