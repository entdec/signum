# frozen_string_literal: true

# @param type [String] Classic notification type `error`, `alert` and `info` + custom `success`
# @param data [String, Hash] `String` for backward compatibility,
#   `Hash` for the new functionality `{title: '', body: '', timeout: 5, countdown: false, action: { url: '', method: '', name: ''}}`.
#   The `title` attribute for `Hash` is mandatory.
module Signum
  module Notification
    class Component < ViewComponent::Base
      def initialize(signal, data: nil)
        @signal = signal
        @data = data.nil? ? {} : data.deep_symbolize_keys
        @data[:timeout] ||= 5
      end
    end
  end
end
