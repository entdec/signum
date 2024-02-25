module Signum
  module NotificationDrawer
    class Component < ViewComponent::Base
      attr_reader :notification_container_id, :signals

      def initialize(signals, notification_container_id)
        @signals = signals
        @notification_container_id = notification_container_id
      end
    end
  end
end
