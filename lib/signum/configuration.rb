# frozen_string_literal: true

module Signum
  class Configuration
    attr_accessor :hide_after

    def initialize
      @hide_after = 3000
    end
  end
end
