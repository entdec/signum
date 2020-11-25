# frozen_string_literal: true

module Signum
  module ActiveRecordHelpers
    extend ActiveSupport::Concern

    class_methods do
      def signalable
        has_many :signals, as: :signalable, class_name: 'Signum::Signal'

        send :include, Signum::ActiveRecordHelpers::InstanceMethods
        extend(Signum::ActiveRecordHelpers::ClassMethods)
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def online!
        update(presence: 'online')
        Signum::SendSignalsJob.perform_later(self)
      end

      def offline!
        update(presence: 'offline')
      end

      def away!
        update(presence: 'away')
      end
    end
  end
end
