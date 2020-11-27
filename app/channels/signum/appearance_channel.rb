# frozen_string_literal: true

require_dependency 'signum/application_cable/channel'

module Signum
  class AppearanceChannel < ApplicationCable::Channel
    def subscribed
      Rails.logger.info('subscribed')
      current_user.online!
    end

    def unsubscribed
      Rails.logger.info('unsubscribed')
      current_user.offline!
    end

    def appear(_data)
      Rails.logger.info('appear')
      current_user.appeared! # (on: data['appearing_on'])
      Signum::SendSignalsJob.perform_later(current_user)
    end

    def away
      Rails.logger.info('away')
      current_user.away!
    end
  end
end
