# frozen_string_literal: true

Signum.setup do |config|
  config.base_controller = "::ApplicationController"
  config.admin_authentication_module = "Authenticated"
  config.hide_after = 60_000 if Rails.env.test?
  config.current_user = -> { Current.user }
  config.drawer_notifications_container_id = -> { "drawer_notifications_#{Current.user.id}" }
  config.balloon_notifications_container_id = -> { "notifications_#{Current.user.id}" }
end
