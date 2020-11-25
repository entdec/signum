require "signum/engine"
require 'signum/active_record_helpers'

module Signum
  # Your code goes here...
    # Include helpers
    ActiveSupport.on_load(:active_record) do
      include ActiveRecordHelpers
    end
end
