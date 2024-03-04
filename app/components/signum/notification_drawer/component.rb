module Signum
  module NotificationDrawer
    class Component < ViewComponent::Base
      attr_reader :signals

      def initialize(signals)
        @signals = signals
      end
    end
  end
end
