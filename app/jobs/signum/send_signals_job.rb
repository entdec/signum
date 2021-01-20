module Signum
  class SendSignalsJob < ApplicationJob
    def perform(user)
      return unless user.presence == 'appeared'

      user.signals.pending.each do |signal|
        puts "signal: #{signal.id}"
        pp signal
        Signum::SignalChannel.broadcast_to(user, signal.attributes)
      end
    end
  end
end
