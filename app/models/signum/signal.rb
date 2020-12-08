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
      state :shown
      state :closed

      event :show do
        transition pending: :shown
      end

      event :close do
        # We allow both pending and shown, because the user could close, before we process shown
        transition %i[pending shown] => :closed
      end
    end

    private

    def signal
      Signum::SendSignalsJob.perform_later(signalable)
    end
  end
end
