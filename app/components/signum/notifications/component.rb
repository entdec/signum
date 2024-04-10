module Signum
  module Notifications
    class Component < ViewComponent::Base
      attr_reader :keys
      def initialize(keys = nil)
        @keys = keys
      end
    end
  end
end
