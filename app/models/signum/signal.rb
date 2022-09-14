module Signum
  class Signal < ApplicationRecord
    belongs_to :signalable, polymorphic: true
    after_commit :signal

    validates :text, presence: true

    scope :pending, -> { with_state(:pending) }
    scope :shown, -> { with_state(:shown) }
    scope :closed, -> { with_state(:closed) }

    state_machine initial: :pending do
      state :pending
      state :broadcasted
      state :shown
      state :closed

      event :broadcast do
        transition any => :broadcasted
      end

      event :show do
        transition any => :shown
      end

      event :close do
        # We allow pending, sent and shown, because the user could close, before we process
        transition any => :closed
      end
    end

    private

    def signal
      Signum::SendSignalsJob.perform_later(self) if pending?
    end
  end
end
