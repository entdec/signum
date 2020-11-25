module Signum
  class Signal < ApplicationRecord
    belongs_to :signalable, polymorphic: true
    after_commit :signal

    private

    def signal
      Signum::SendSignalsJob.perform_later(signalable)
    end
  end
end
