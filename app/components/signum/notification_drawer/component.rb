module Signum
  module NotificationDrawer
    class Component < ViewComponent::Base
      def initialize(signals, notification_container_id)
        @signals = signals
        @notification_container_id = notification_container_id
      end
    end
  end
end
