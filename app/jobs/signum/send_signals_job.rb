# frozen_string_literal: true

module Signum
  class SendSignalsJob < ApplicationJob
    def perform(signal)
      signal.broadcast!
      Turbo::StreamsChannel.broadcast_prepend_to(:signals, target: "notifications_#{signal.signalable_id}",
                                                           html: ApplicationController.render(Signum::Notification::Component.new(signal)))
      Turbo::StreamsChannel.broadcast_prepend_to(:signals, target: "drawer_notifications_#{signal.signalable_id}",
                                                           html: ApplicationController.render(Signum::NotificationDrawerItem::Component.new(signal)))
    end
  end
end
