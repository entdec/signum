module Signum
  module NotificationDrawerItem
    class Component < ViewComponent::Base
      attr_reader :signal, :data

      with_collection_parameter :signal

      def initialize(signal:, data: nil)
        @signal = signal
        @data = data.nil? ? {} : data.deep_symbolize_keys

        @data[:timeout] ||= 5
        @data[:type] ||= :drawer_item
      end
    end
  end
end
