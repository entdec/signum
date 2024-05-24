require_dependency 'signum/application_controller'

module Signum
  class SignalController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
      signal = Signum::Signal.find(signal_params[:id])
      signal.show! if signal.broadcasted?
      head :ok
    end

    def close
      signal = Signum::Signal.find(signal_params[:id])
      signal.close!
      head :ok
    end

    def close_all
      signals = Signum.config.current_user.call.signals.where.not(state: "closed")
      signals.each(&:close!)
      head :ok
    end

    private

    def signal_params
      params.require(:signal).permit(:id)
    end
  end
end
