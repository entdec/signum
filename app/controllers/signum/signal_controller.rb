module Signum
  class SignalController < ApiController
    def show
      signal = Signum::Signal.find(signal_params[:id])
      signal.show! if signal.broadcasted?
    end

    def close
      signal = Signum::Signal.find(signal_params[:id])
      signal.close!
    end

    private

    def signal_params
      params.require(:signal).permit(:id)
    end
  end
end
