module Signum
  module NotificationDrawerItem
    class Component < ViewComponent::Base
      attr_reader :signal
      def initialize(signal)
        @signal = signal
      end
    end
  end
end
