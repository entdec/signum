module Signum
  class SendSignalsJob < ApplicationJob
    def perform(user)
      return unless user.presence == 'online'

      user.signals.each do |signal|
        Signum::SignalChannel.broadcast_to(user, signal.attributes)
      end
    end
  end
end
