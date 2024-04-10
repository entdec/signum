require 'test_helper'

module Signum
  class SignalTest < ActiveSupport::TestCase
    test "creates a signal" do
      subject = Signum.success(users(:one), text: 'test')
      assert subject
    end
  end
end
