module Signum
  class Signal < ApplicationRecord
    belongs_to :signalable, polymorphic: true
    belongs_to :subjectable, polymorphic: true, optional: true

    has_many_attached :attachments

    after_create_commit do
      Signum::SendSignalsJob.perform_later(self, true)
    end

    after_update_commit do
      if saved_change_to_title? || saved_change_to_text? || saved_change_to_count? || saved_change_to_total? || saved_change_to_metadata?
        Signum::SendSignalsJob.perform_later(self,
                                             false)
      end
    end

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
  end
end
