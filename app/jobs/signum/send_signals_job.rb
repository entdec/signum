# frozen_string_literal: true

module Signum
  class SendSignalsJob < ApplicationJob
    def perform(signal)
      Turbo::StreamsChannel.broadcast_prepend_to(:signals, target: "notifications_#{signal.signalable_id}",
                                                           html: ApplicationController.render(Signum::NotificationComponent.new(signal)))
    end
  end
end
