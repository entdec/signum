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
      current_user.online! # (on: data['appearing_on'])
    end

    def away
      current_user.away!
    end
  end
end
