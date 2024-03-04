module Signum
  class Signal < ApplicationRecord
    belongs_to :signalable, polymorphic: true
    belongs_to :subjectable, polymorphic: true, optional: true

    has_many_attached :attachments

    after_create_commit :broadcast_create
    after_update_commit :broadcast_update

    def broadcast_create
      broadcast! if can_broadcast?

      broadcast_prepend_to(:signals, target: Signum.config.balloon_notifications_container_id.call,
                                     html: ApplicationController.render(Signum::Notification::Component.new(self)))

      broadcast_prepend_to(:signals, target: Signum.config.drawer_notifications_container_id.call,
                                     html: ApplicationController.render(Signum::NotificationDrawerItem::Component.new(signal: self)))
    end

    def broadcast_update
      return if saved_change_to_state? && (broadcasted? || shown?)

      if saved_change_to_state? && closed?
        broadcast_remove_to(:signals, target: "notification_drawer_item_parent_#{signalable_id}_#{id}")
        return
      end

      broadcast_replace_to(:signals, target: "notification_balloon_#{signalable_id}_#{id}",
                                     html: ApplicationController.render(Signum::NotificationBody::Component.new(self, { type: :balloon, timeout: 5 })))
      broadcast_replace_to(:signals, target: "notification_drawer_item_#{signalable_id}_#{id}",
                                     html: ApplicationController.render(Signum::NotificationBody::Component.new(self, { type: :drawer_item, timeout: 5 })))
    end

    validates :text, presence: true

    scope :pending, -> { with_state(:pending) }
    scope :shown, -> { with_state(:shown) }
    scope :closed, -> { with_state(:closed) }
    scope :unclosed_sticky, ->(signalable) { without_state(:closed).where(signalable: signalable, sticky: true) }

    state_machine initial: :pending do
      state :pending
      state :broadcasted
      state :shown
      state :read
      state :closed

      event :broadcast do
        transition any => :broadcasted
      end

      event :show do
        transition any => :shown
      end

      event :read do
        transition shown: :read
      end

      event :close do
        # We allow pending, sent and shown, because the user could close, before we process
        transition any => :closed
      end
    end
  end
end
