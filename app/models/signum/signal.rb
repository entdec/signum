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
        transition pending: :broadcasted
      end

      event :show do
        transition broadcasted: :shown
      end

      event :close do
        # We allow pending, sent and shown, because the user could close, before we process
        transition %i[pending broadcasted shown] => :closed
      end
    end

    private

    def signal
      Signum::SendSignalsJob.set(wait: 1).perform_later(signalable)
    end
  end
end
