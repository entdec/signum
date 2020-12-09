# frozen_string_literal: true

require_dependency 'signum/application_cable/channel'

module Signum
  class AppearanceChannel < ApplicationCable::Channel
    def subscribed
      current_user.online!
    end

    def unsubscribed
      current_user.offline!
    end

    def appear(_data)
      current_user.appeared! # (on: data['appearing_on'])
      Signum::SendSignalsJob.perform_later(current_user) if current_user.signals.pending.count >= 1
    end

    def away
      current_user.away!
    end
  end
end
