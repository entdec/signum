module Signum
  module NotificationDrawerItem
    class Component < ViewComponent::Base
      def initialize(signal)
        @signal = signal
      end
    end
  end
end
