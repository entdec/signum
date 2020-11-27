module Signum
  class Signal < ApplicationRecord
    belongs_to :signalable, polymorphic: true
    after_commit :signal

    validates :text, presence: true

    scope :pending, -> { with_state(:pending) }
    scope :opened, -> { with_state(:opened) }
    scope :closed, -> { with_state(:closed) }

    state_machine initial: :pending do
      state :pending
      state :seen
      state :closed

      event :see do
        transition pending: :seen
      end

      event :close do
        transition seen: :closed
      end
    end

    private

    def signal
      Signum::SendSignalsJob.perform_later(signalable)
    end
  end
end
