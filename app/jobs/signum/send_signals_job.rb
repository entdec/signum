# frozen_string_literal: true

module Signum
  class SendSignalsJob < ApplicationJob
    def perform(user)
      return unless user.presence == 'appeared'

      user.signals.pending.order(:created_at).each do |signal|
        signal.broadcast!
        Signum::SignalChannel.broadcast_to(user,
                                           signal.attributes
                                                 .merge({ hide_after: Signum.config.hide_after }))
      end
    end
  end
end
