require "test_helper"

module Signum
  class SignalTest < ActiveSupport::TestCase
    test "creates a signal for a signable" do
      subject = Signum.success(users(:one), text: "test")
      assert subject
      assert_equal users(:one), subject.signalable
      assert_equal "success", subject.kind
      assert_equal "test", subject.text
    end

    test "creates a signal for a key" do
      subject = Signum.success(:smurrefluts, text: "test")
      assert subject
      assert_equal "smurrefluts", subject.key
      assert_equal "success", subject.kind
      assert_equal "test", subject.text
    end
  end
end
