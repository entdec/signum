# frozen_string_literal: true

module Signum
  class Configuration
    attr_accessor :hide_after
    attr_accessor :user_model_name

    def initialize
      @base_controller = "User"
      @hide_after = 3000
    end
  end
end
